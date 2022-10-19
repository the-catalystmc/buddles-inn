class RoomsController < ApplicationController
  # before_action :set_room

  def toggle_published
    @room.toggle! :available
  end

	def index
		@rooms = Room.all
	end

	def show
    @rooms = Room.all
    @room = Room.find(params[:id])
	end

	def new
		@room = Room.new
	end

	def create
		@room = Room.new(room_params)

		if @room.save
      redirect_to room_path(@room.id), notice: "Room was successfully created."
    else
      flash.now[:error] = "Rats! Fix your mistakes, please."
      render :new, status: :unprocessable_entity
    end
  end

	def edit
		@room = Room.find(params[:id])
	end

	def update
    @room = Room.find(params[:id])
    # if @room.update(available: !@room.available)
    #   if @room.available
    #     flash[:notice] = 'Public'
    #   else
    #     flash[:error] = 'Not Public'
    #   end
    # else
    #   flash[:error] = 'Public status couldn\'t be updated'
    # end
    # redirect_to room_url(@room)
    @room = Room.find(params[:id])

    if @room.update(room_params)
      redirect_to room_path(@room.id), notice: "Room was successfully updated."
    else
      flash.now[:alert] = "Rats! Fix your mistakes, please."
      render :edit, status: :unprocessable_entity
    end
  end

	def destroy
    @quote.destroy
    redirect_to room_path, notice: "Room was successfully destroyed."
  end

	private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:number, :price_for_day, :price_for_partial, :available, :amenities, :image)
  end
end