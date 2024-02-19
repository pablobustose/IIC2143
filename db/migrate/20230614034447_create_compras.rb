class CreateCompras < ActiveRecord::Migration[7.0]
  def change
    create_table :compras do |t|
      t.integer :id_cliente
      t.integer :id_vendedor
      t.string :status

      t.timestamps
    end
  end
end
