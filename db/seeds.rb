	# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

josh = User.create!(:email => "jcrowe@interpract.com", :password => "jesus4life")
josh.update_attribute(:admin,true)
trent = User.create!(:email => "trent@damagegallery.com", :password => "jesus4life")
trent.update_attribute(:admin,true)
casey = User.create!(:email => "casey@damagegallery.com", :password => "dmgcasey123")
casey.update_attribute(:admin,false)
derek = User.create!(:email => "derek@damagegallery.com", :password => "dmgderek1234")
derek.update_attribute(:admin,false)

shirts = ["Cosby Creme", "Roak", "Rose", "Floral", "Repeat", "Control", "Ruff", "Trops", "Bill f'd Murray", "Nine Lifes", "Serpent", "EZE"]
hats = ["Hat-Embrdry", "Hat-Patch" ]
beanies = ["Beanie-Trdtnl", "Beanie-Cuff"]
beaniesSizes = ["adult"]
hatColors = ["Blk/Blk", "Blk/Mrn", "Wht/Mrn", "Blk/Mrn", "Wht/Nvy", "Wht/Blk", "Gld/Nvy", "Wht/Grn"]
beaniesColors = ["Blk/Blk", "Blk/Mrn", "Wht/Mrn", "Blk/Mrn", "Wht/Nvy", "Wht/Blk", "Gld/Nvy", "Wht/Grn"]
hatSizes = ["Snap-back"]
shirtColors = ["White"]
shirtSizes = ["Small","Medium","Large","X-Large", "XX-Large"]
stores = ["STOCK", "Collective", "Stade Co", "Thalia Surf Shop", "Pharmacy Board Shop", "Port", "Lobby", "The Attic", "RCH"]
qty = ["40"]


shirts.each do |shirt|
	shirtColors.each do |color|
		shirtSizes.each do |size|
			qty.each do |qty|
				Shirt.create!(:name => shirt, :color => color, :size => size, :qty => qty)
			end
		end
	end
end

hats.each do |shirt|
	hatColors.each do |color|
		hatSizes.each do |size|
			qty.each do |qty|
				Hat.create!(:name => shirt, :color => color, :size => size, :qty => qty)
			end
		end
	end
end

beanies.each do |shirt|
	beaniesColors.each do |color|
		beaniesSizes.each do |size|
			qty.each do |qty|
				Beanie.create!(:name => shirt, :color => color, :size => size, :qty => qty)
			end
		end
	end
end

stores.each do |store|
	Store.create!(:name => store)
end

1.times do |t|
	product = Product.all
	stock = Store.first
	
	stock.products << product
end