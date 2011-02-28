module ActiveCart
  module Items
    
    class MongoidItem
      include Mongoid::Document
      include Mongoid::Timestamps
      
      embedded_in :cart, :class_name => "ActiveCart::StorageEngines::MongoidStorage", :inverse_of => :items
      
      field :name
      field :price
      
      def quantity
        @quantity || 0
      end
      
      def quantity=(quantity)
        @quantity = quantity
      end
      
    end
    
  end
end