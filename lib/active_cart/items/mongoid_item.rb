module ActiveCart
  module Items
    
    class MongoidItem
      include Mongoid::Document
      include Mongoid::Timestamps
      
      embedded_in :cart, :class_name => "ActiveCart::StorageEngines::MongoidStorage", :inverse_of => :items
      
      field :name
      field :price
      field :quantity, :type => Integer, :default => 0
      
    end
    
  end
end