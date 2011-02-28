module ActiveCart
  module StorageEngines
    
    class MongoidStorage
      include Mongoid::Document
      include Mongoid::Timestamps
      include ActiveCart::CartStorage
      
      embeds_many :items, :class_name => "ActiveCart::Items::MongoidItem"

      def invoice_id
         self._id
      end
      
      # delegate that these item 'lookup' methods are called on the :items collection
      extend Forwardable
      def_delegators :items, :[], :<<, :[]=, :at, :clear, :collect, :map, :delete, :delete_at, :each, :each_index, :empty?, :eql?, :first, :include?, :index, :inject, :last, :length, :pop, :push, :shift, :size, :unshift
      
      # write the basket to mongo after adding to the cart
      def add_to_cart_with_save(item, quantity = 1, options = {})
        add_to_cart_without_save(item, quantity, options)
        self.save!
      end
      alias_method_chain :add_to_cart, :save
      
      # write the basket to mongo after removing from the cart
      def remove_from_cart_with_save(item, quantity = 1, options = {})
        remove_from_cart_without_save(item, quantity, options)
        self.save!
      end
      alias_method_chain :remove_from_cart, :save
      
    end
    
  end
end