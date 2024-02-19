class AddTallaToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :talla, :string
  end
end

