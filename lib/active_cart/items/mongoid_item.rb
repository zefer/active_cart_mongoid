module ActiveCart
  module Items
    
    # mixin to your product class e.g. include ActiveCart::Items::MongoidItem
    module MongoidItem
      extend ActiveSupport::Concern

      included do
        field :quantity, :type => Integer, :default => 0

        embedded_in :cart, :class_name => "ActiveCart::StorageEngines::MongoidStorage", :inverse_of => :items
      end
      
      # must be definied in the concrete class. Return the price in the format in which you want to persist it, which may be pence/cents to reduce rounding errors
      def price
        raise NotImplementedError
      end
      
    end
    
  end
end