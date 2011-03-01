module ActiveCart
  module Items
    
    # mixin to your product class e.g. include ActiveCart::Items::MongoidItem
    module MongoidItem
      extend ActiveSupport::Concern
      
      included do
        field :quantity, :type => Integer, :default => 0

        # embedded_in :cart, :class_name => "ActiveCart::StorageEngines::MongoidStorage", :inverse_of => :items
      end
      
      module ClassMethods
        
        # you may wish to instantiate a new item using a specified product argument.
        # The item may adopt the product's id to ensure that the cart knows when it already contains this product
        def initialize
          raise NotImplementedError "you must define a constructor in your mixee class to override cart item's id. See README."
        end
        
      end

      module InstanceMethods
        
        # must be definied in the concrete class. Return the price in the format in which you want to persist it, which may be pence/cents to reduce rounding errors
        def price
          raise NotImplementedError "you must define a method in your mixee class which returns the price of the item in the format it will be written to the DB, e.g. pence/cents."
        end
        
      end
      
    end
    
  end
end