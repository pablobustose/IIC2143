class Addtallasproduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :cantidad_xs, :integer
    add_column :products, :cantidad_s, :integer
    add_column :products, :cantidad_m, :integer
    add_column :products, :cantidad_l, :integer
    add_column :products, :cantidad_xl, :integer
  end
end
