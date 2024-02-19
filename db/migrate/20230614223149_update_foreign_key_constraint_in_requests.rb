class UpdateForeignKeyConstraintInRequests < ActiveRecord::Migration[7.0]
  def up
    remove_foreign_key :requests, :users
    add_foreign_key :requests, :users, on_delete: :cascade
  end

  def down
    remove_foreign_key :requests, :users
    add_foreign_key :requests, :users
  end
end
