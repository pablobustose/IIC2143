class AddIdVendedorRoom < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :id_vendedor, :integer
  end
end
