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
      def_delegators :items, :include?, :<<, :inject, :index, :at, :delete_at
      
    end
    
  end
end