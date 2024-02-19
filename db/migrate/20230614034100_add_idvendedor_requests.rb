class AddIdvendedorRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :vendedor_id, :integer
  end
end
