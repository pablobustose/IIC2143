class AddTallaCompra < ActiveRecord::Migration[7.0]
  def change
    add_column :compras, :talla, :string
  end
end
