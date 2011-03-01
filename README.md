active_cart_mongoid
===================

Mongoid storage bolt-on for the [active_cart](http://github.com/madpilot/active_cart) gem

A work-in-progress, any contribution very welcome!

Usage
=====
	
Mixin the MongoidItem into your CartItem (or similar) class, e.g:

	class CartItem
	  include Mongoid::Document
	  include ActiveCart::Items::MongoidItem

	  # a cart item will always contain a product
	  embeds_one :product
	  embedded_in :ShoppingCart, :inverse_of => :items
	  
	  # you need to override the construtor to ensure the cart item's ID represents the product's ID. otherwise, the cart will always think you are adding a different product and will never increment quantity.
	  def initialize(product)
	    attrs = {
	      :id => product.id,
	      :product => product
	    }
	    super(attrs)
	  end
	
	  # this should return the price as it will be serialised in the basket collection, e.g. pence/cents
	  def price
		product.price
	  end
	end
	
Extend the ActiveCart::StorageEngines::MongoidStorage class with a concrete Cart / Basket (or whatever you want to call it) class, e.g.:

	class ShoppingCart < ActiveCart::StorageEngines::MongoidStorage
	  # you must define the mongoid association to model the cart contents, e.g:
	  embeds_many :items, :class_name => "Product"
	  # optionally change which collection the carts are stored
	  store_in :shopping_baskets
	end

Then your cart items can be serialised to a basket

	include ActiveCart
	c = Cart.new(ShoppingCart.new)
	i = CartItem.new(Product.first)
	c.add_to_cart(i)

Contributing to active_cart_mongoid
===================================
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
=========

Copyright (c) 2011 Joe Roberts. See LICENSE.txt for
further details.

