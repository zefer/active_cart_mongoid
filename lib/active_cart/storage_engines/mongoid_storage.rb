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
      
    end
    
  end
end