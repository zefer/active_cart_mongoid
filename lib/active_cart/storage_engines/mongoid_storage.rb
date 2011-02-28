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
    end
    
  end
end