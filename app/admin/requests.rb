ActiveAdmin.register Request do
  permit_params :user_id, :product_id

    # Configuración del encabezado de la página en ActiveAdmin
    config.clear_action_items!
    
    # Configuración del índice de los productos en ActiveAdmin
    index do
      selectable_column
      column :id
      column :user_id
      column :vendedor_id
      column :product_id
      column :talla
      actions
    end
end