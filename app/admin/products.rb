ActiveAdmin.register Product do
  permit_params :name, :price

    # Configuración del encabezado de la página en ActiveAdmin
    config.clear_action_items!

    # Configuración del índice de los productos en ActiveAdmin
    index do
      selectable_column
      column :id
      column :name
      column :price
      column :cantidad_xs
      column :cantidad_s
      column :cantidad_m
      column :cantidad_l
      column :cantidad_xl
      actions # Esto muestra las acciones predeterminadas (editar, eliminar, etc.)
    end
    
    # Configuración del formulario de edición en ActiveAdmin
    form do |f|
      f.inputs "Product Details" do
        f.input :name
        f.input :price
      end
      f.actions
    end
end