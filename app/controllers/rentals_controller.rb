class RentalsController < ApplicationController
    # before_action :set_rentals, only: %i[index]

    def index
        @rentals = Rental.all
    end

    def show
        @rental = Rental.find(params[:id])
    end

    def new
		@rental = Rental.new
	end

    def create
        @rental = Rental.new(rental_params)
    
            if @rental.save
                redirect_to rental_path(@rental.id), notice: "Rental was successfully created."
            else
                flash.now[:error] = "Rats! Fix your mistakes, please."
                render :new, status: :unprocessable_entity
            end
        end
  
    def destroy
      @rental = rentals.find(params[:id])
      @rental.destroy
      redirect_to room_path, notice: "Rental was successfully destroyed."
    end

    def edit
		@rental = Rental.find(params[:id])
	end

    def update
        @room = Room.find(params[:id])
        # if @rental.update(available: !@rental.available)
        #   if @rental.available
        #     flash[:notice] = 'Public'
        #   else
        #     flash[:error] = 'Not Public'
        #   end
        # else
        #   flash[:error] = 'Public status couldn\'t be updated'
        # end
        # redirect_to rental_url(@rental)
        @rental = Rental.find(params[:id])
    
        if @rental.update(rental_params)
          redirect_to rental_path(@rental.id), notice: "Rental was successfully updated."
        else
          flash.now[:alert] = "Rats! Fix your mistakes, please."
          render :edit, status: :unprocessable_entity
        end
      end
  
    private
  
    # def set_rentals
    #   @rentals = Rental.all
    # end
  
    def rental_params
      params.require(:rental).permit(
        :check_in,
        :check_out,
        :shift,
        :number_of_days,
        :number_of_hours,
        :start_date,
        :end_date,
        :room_id
      )
    end
end