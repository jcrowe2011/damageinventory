class AddColorSizeToProduct < ActiveRecord::Migration
  def change
    add_column :products, :color, :string
    add_column :products, :size, :string
  end
end
