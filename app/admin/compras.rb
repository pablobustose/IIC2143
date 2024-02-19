ActiveAdmin.register Compra do
  permit_params :product_id, :id_cliente, :id_vendedor

    # Configuración del encabezado de la página en ActiveAdmin
    config.clear_action_items!
    
    # Configuración del índice de los productos en ActiveAdmin
    index do
      selectable_column
      column :id
      column :product_id
      column :talla
      column :id_cliente
      column :id_vendedor
      column :status
      actions
    end
end