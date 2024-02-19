class ComprasController < ApplicationController
    # GET /products
  def index
    @compras = Compra.all
  end

  # GET /products/new
  def new
    @compra = Compra.new
  end
  # POST /products
  def create
    @solicitud = Solicitud.find(params[:solicitud_id])
    @compra = Compra.new(product_id: params[:product_id], id_cliente: current_user.id, id_vendedor: @solicitud.vendedor_id, status: "Pendiente", talla: @solicitud.talla)
    if @compra.save
      logger.info "redirect"
      redirect_to @compra, notice: 'Compra creada exitosamente.'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def update
    @compra = Compra.find(params[:id])

    if @compra.update(compra_params)
      if @compra.status == "Aceptada por vendedor"
        # Restar la cantidad comprada del stock del producto solo si el estado es "aceptada por vendedor"
        @producto = Product.find(@compra.product_id)
        if @compra.talla == "XS"
          @producto.cantidad_xs -= 1
        elsif @compra.talla == "S"
          @producto.cantidad_s -= 1
        elsif @compra.talla == "M"
          @producto.cantidad_m -= 1
        elsif @compra.talla == "L"
          @producto.cantidad_l -= 1
        elsif @compra.talla == "XL"
          @producto.cantidad_xl -= 1
        end
        @producto.save
      end


      redirect_to compras_path, notice: 'Estado de compra actualizado exitosamente.'
    else
      render :edit
    end
  end

  # GET /products/:id
  def show
    @compra = Compra.find(params[:id])
    @product = Product.find(@compra.product_id) if @compra.product_id.present?
  end
  #GET /products/:id/edit

  def destroy
    @compra = Compra.find(params[:id])
    @compra.destroy
    redirect_to compras_url, notice: "Room was successfully destroyed."
  end

  private
  def compra_params
    params.require(:compra).permit(:product_id, :id_cliente, :id_vendedor, :status, :talla)
  end
end
