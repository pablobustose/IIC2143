ActiveAdmin.register Review do
  permit_params :user_id, :product_id, :title, :description, :rating

    # Configuración del encabezado de la página en ActiveAdmin
    config.clear_action_items!
    
    # Configuración del índice de los productos en ActiveAdmin
    index do
      selectable_column
      column :id
      column :title
      column :description
      column :rating
      column :user_id
      column :product_id
      actions
    end
end