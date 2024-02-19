ActiveAdmin.register User do
  permit_params :name, :email

    # Configuración del encabezado de la página en ActiveAdmin
    config.clear_action_items!
    
    # Configuración del índice de los productos en ActiveAdmin
    index do
      selectable_column
      column :id
      column :name
      column :email
      actions
    end
    
    # Configuración del formulario de edición en ActiveAdmin
    form do |f|
      f.inputs "User Details" do
        f.input :name
        f.input :email
      end
      f.actions
    end
end