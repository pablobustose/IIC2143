class RoomsController < ApplicationController
    # GET /products
  def index
    @rooms = Room.all
  end

  # GET /products/new
  def new
    @room = Room.new
    @products = Product.all
  end
  # POST /products
  def create
    @room = Room.new(room_params)
    @room.email_cliente = current_user.email
    @room.id_cliente = current_user.id
    @room.nombre_vendedor = User.find(@room.id_vendedor).email

    if @room.save
      logger.info "redirect"
      redirect_to room_url(@room), notice: "Se creo exitosamente la sala de chat."
    else
      render :new, status: :unprocessable_entity
    end
  end
  # GET /products/:id
  def show
    @room = Room.find(params[:id])
  end
  #GET /products/:id/edit

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_url, notice: "Room was successfully destroyed."
  end

  private
  def room_params
    params.require(:room).permit(:name, :id_vendedor)
  end
end

