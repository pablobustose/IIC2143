class AddIdVendedorProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :id_vendedor, :integer
  end
end
