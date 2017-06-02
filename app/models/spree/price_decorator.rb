Spree::Price.class_eval do
 	before_update :price_before_discount

 	def price_before_discount
 		amount + discount
 	end

 	def price_before_discount=(price_before_discount)
 		price + discount
 	end
end