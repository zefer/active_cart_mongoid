active_cart_mongoid
===================

Mongoid storage bolt-on for the [active_cart](http://github.com/madpilot/active_cart) gem

A work-in-progress, any contribution very welcome!

Usage
=====
	
Mixin the MongoidItem into your product class, e.g:

	class Product
	  include Mongoid::Document
	  include Mongoid::Timestamps

	  include ActiveCart::Items::MongoidItem

	  field :description, :type => String
	end

Then your product can be serialised to a basket

	include ActiveCart
	c = Cart.new(ActiveCart::StorageEngines::MongoidStorage.new)
	i = Product.new # this should be a class which mixes-in the ActiveCart::Items::MongoidItem module
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

