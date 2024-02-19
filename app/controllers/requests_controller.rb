class RequestsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @requests = current_user.requests
  end
  
  def new
    @request = Request.new
  end
  
  def create
    @product = Product.find(params[:product_id])
      @request = @product.requests.build(user: current_user, talla: params[:talla])
      @request.vendedor_id = @product.id_vendedor
      if @request.save
        redirect_to product_path(@product), notice: "Solicitud creada exitosamente."
      else
        render :new
      end
    end
  
  def show
    @request = current_user.requests.find(params[:id])
  end
    
  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to requests_path, notice: "La solicitud ha sido eliminada."
  end

  def comprar
    @request = Request.find(params[:id])
    @compra = Compra.new(product_id: @request.product_id, id_cliente: current_user.id, id_vendedor: @request.vendedor_id, status: "Pendiente", talla: @request.talla)
    if @compra.save
      redirect_to @compra, notice: 'Compra creada exitosamente.'
      @request.destroy
      # Manejar el caso en el que la compra no se pueda guardar correctamente
      # Puedes renderizar una vista de error o redirigir a una página de error.
    end
  end

    private
  
  def request_params
    params.require(:request).permit(:product_id, :talla, :status)
  end
  end