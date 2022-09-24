class RoomController < ApplicationController
	def index
		@rooms = Room.all
	end

	def show

	end

	def new
		@room = Room.new
	end

	def create
		@room = Room.new(room_params)

		if @room.save
      redirect_to room_path, notice: "Room was successfully created."
    else
      render :new
    end
  end

	def edit
		
	end

	def update
    if @room.update(room_params)
      redirect_to room_path, notice: "Room was successfully updated."
    else
      render :edit
    end
  end

	def destroy
    @quote.destroy
    redirect_to quotes_path, notice: "Room was successfully destroyed."
  end

	private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:number, :price, :available, :amenities)
  end
end