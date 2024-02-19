class AddIdproductCompras < ActiveRecord::Migration[7.0]
  def change
    add_column :compras, :product_id, :integer
  end
end
