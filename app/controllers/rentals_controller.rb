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
      @rentals = Rental.all
      @rental = @rentals.find(params[:id])
      @rental.destroy
      redirect_to rentals_path, notice: "Rental was successfully destroyed."
    end

    def edit
		@rental = Rental.find(params[:id])
	  end

    def update
      @rental = Rental.find(params[:id])
        @room = Room.find(params[:id])
        if @rental.update( 
          occupant: @rental.occupant, 
          check_in: !@rental.check_in,
          check_out: !@rental.check_out,
          shift: @rental.shift,
          expected_checkout: @rental.expected_checkout,
          start_date: @rental.start_date,
          room_id: @rental.room_id
        )
          if @rental.check_out
            flash[:notice] = 'Checked Out'
          else
            flash[:error] = 'Checked In'
          end
        else
          flash[:error] = 'Public status couldn\'t be updated'
        end
        redirect_to rental_url(@rental)
    
        # if @rental.update(rental_params)
        #   redirect_to rental_path(@rental.id), notice: "Rental was successfully updated."
        # else
        #   flash.now[:alert] = "Rats! Fix your mistakes, please."
        #   render :edit, status: :unprocessable_entity
        # end
      end
  
    private
  
    # def set_rentals
    #   @rentals = Rental.all
    # end
  
    def rental_params
      params.require(:rental).permit(
        :occupant,
        :check_in,
        :check_out,
        :shift,
        :expected_checkout,
        :start_date,
        :room_id
      )
    end
end