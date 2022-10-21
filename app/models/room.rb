class Room < ApplicationRecord
    has_many :rentals, dependent: :destroy
    # enum :available, [:true, :false]
    def all_rooms
        room.order(number: :desc)
    end

    def rental_check(param)
        check = []
        @rentals = param.each do |room|
            room.rentals.each do |rental|
              if rental.check_in == false
                check.push(room)
              end
            end
        end

    #     rentals.each do |rental|
    #         if rental.check_in.includes? true
    #             check = true
    #         else
    #             check = false
    #         end
    #     end
        check
    end
    
end
