class RoomMessagesController < ApplicationController
  before_action :set_room, only: [:new, :create, :destroy]
  
    # GET /products/:product_id/reviews/new
  def new
    @room_message = RoomMessage.new
  end
  
    # POST /products/:product_id/reviews
  def create
    @room_message = RoomMessage.new(room_message_params)
    @room_message.user = current_user
    @room_message.room = @room

    if @room_message.save
      redirect_to @room, notice: 'El mensaje fue creado exitosamente.'
    else
      render :new
    end
  end
  
    private
  
  def set_room
    @room = Room.find(params[:room_id])
  end
  
 

  def room_message_params
    params.require(:room_message).permit(:content, :user_id, :room_id)
  end
end