class UpdateForeignKeyOnReviews < ActiveRecord::Migration[7.0]
  def up
    remove_foreign_key :reviews, :products
    add_foreign_key :reviews, :products, on_delete: :cascade
  end

  def down
    remove_foreign_key :reviews, :products
    add_foreign_key :reviews, :products
  end
end