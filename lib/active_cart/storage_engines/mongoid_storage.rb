module ActiveCart
  module StorageEngines
    
    # extend this class with a concrete Cart/Basket class. Make sure you define the embeds_many :items in your concrete class (see below)
    class MongoidStorage
      include Mongoid::Document
      include Mongoid::Timestamps
      include ActiveCart::CartStorage
      
      # embeds_many MUST be defined in your concrete class, to define the basket items - this may be a Product class, or a LineItem class, for example
      # embeds_many :items, :class_name => "Product"
      
      def invoice_id
         self._id
      end
      
      # delegate that these item 'lookup' methods are called on the :items collection
      extend Forwardable
      def_delegators :items, :[], :<<, :[]=, :at, :clear, :collect, :map, :delete, :delete_at, :each, :each_index, :eql?, :first, :include?, :index, :inject, :last, :length, :pop, :push, :shift, :size, :unshift
      def_delegators :storage_engine, :items
      
      # write the basket to mongo after adding to the cart
      def after_add_to_cart(item, quantity, options)
        self.save!
      end
      
      # write the basket to mongo after removing from the cart
      def after_remove_from_cart(item, quantity, options)
        self.save!
      end
      
      # ensure the embedded item is removed from mongoid when deleting an item
      def delete_at_with_destroy(index)
        self.items[index].destroy
      end
      alias_method_chain :delete_at, :destroy
      
    end
    
  end
end