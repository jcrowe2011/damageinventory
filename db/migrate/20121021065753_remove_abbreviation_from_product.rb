class RemoveAbbreviationFromProduct < ActiveRecord::Migration
  def up
    remove_column :products, :abbreviation
  end

  def down
    add_column :products, :abbreviation, :string
  end
end
