module ActiveCart
  module StorageEngines
    
    class MongoidStorage
      include Mongoid::Document
      include Mongoid::Timestamps
      include ActiveCart::CartStorage

      def invoice_id
         self._id
      end
    end
    
  end
end