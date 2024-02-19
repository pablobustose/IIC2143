class AddIdUserRoom < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :id_cliente, :integer
  end
end
