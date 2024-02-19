class AddForeignKeyOptionsToRequests < ActiveRecord::Migration[7.0]
  def up
    remove_foreign_key :requests, :products
    add_foreign_key :requests, :products, on_delete: :cascade
  end

  def down
    remove_foreign_key :requests, :products
    add_foreign_key :requests, :products
  end
end
