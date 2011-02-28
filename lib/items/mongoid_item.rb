module ActiveCart
  module Items
    
    class MongoidItem
      attr_accessor :id, :name, :price
      include ActiveCart::Item

      def ==(item)
        self._id == item.id
      end
      
      def initialize(id, name, price)
        @id = id
        @name = name
        @price = price
      end
    end
    
  end
end