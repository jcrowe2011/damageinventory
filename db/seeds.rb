# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

cooper = User.create!(:email => "cooperm@susteen.com", :password => "cooper")
cooper.update_attribute(:admin,true)

shirts = ["Cosby Creme", "Roak", "Rose", "Floral", "Repeat"]
hats = ["Lilpenisman", "Logo", "Standard"]
colors = ["Black","White","Gray"]
sizes = ["Small","Medium","Large","X-Large", "XX-Large"]
stores = ["Collective", "Stade Co", "Thalia Surf Shop", "Pharmacy Board Shop"]



shirts.each do |shirt|
	colors.each do |color|
		sizes.each do |size|
			Shirt.create!(:name => shirt, :color => color, :size => size)
		end
	end
end

hats.each do |shirt|
	colors.each do |color|
		sizes.each do |size|
			Hat.create!(:name => shirt, :color => color, :size => size)
		end
	end
end

stores.each do |store|
	Store.create!(:name => store)
end

50.times do |t|
	product = Product.find(rand(Product.all.size)+1)
	store = Store.find(rand(Store.all.size)+1)
	store.products << product
end