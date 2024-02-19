ActiveAdmin.register Room do
  permit_params :name, :email_cliente

    # Configuración del encabezado de la página en ActiveAdmin
    config.clear_action_items!
    
    # Configuración del índice de los productos en ActiveAdmin
    index do
      selectable_column
      column :id
      column :name
      column :nombre_vendedor
      column :email_cliente
      actions
    end
    
    # Configuración del formulario de edición en ActiveAdmin
    form do |f|
      f.inputs "Room Details" do
        f.input :name
        f.input :email_cliente
      end
      f.actions
    end

end