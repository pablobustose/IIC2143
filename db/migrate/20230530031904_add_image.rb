class AddImage < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :image_data, :text
  end
end