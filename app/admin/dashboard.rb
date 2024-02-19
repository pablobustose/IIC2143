# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: "Dashboard" do
    columns do
      column do
        panel "Usuarios" do
          para "Total Clientes: #{User.where.not("email LIKE ?", "%@rincon.cl").count}"
          para "Total Vendedores: #{User.where("email LIKE ?", "%@rincon.cl").count}"
        end
        panel "Productos" do
          para "Total Productos: #{Product.count}"
        end
        panel "Solicitudes" do
          para "Total Solicitudes: #{Request.count}"
        end
        panel "Compras" do
          para "Total Compras: #{Compra.count}"
        end
        panel "Reseñas" do
          para "Total Reseñas: #{Review.count}"
        end
        panel "Rooms" do
          para "Total Chats: #{Room.count}"
        end
        
      end
    end
  end
end