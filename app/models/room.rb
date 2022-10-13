class Room < ApplicationRecord
    # enum :available, [:true, :false]
    def all_rooms
        room.order(number: :desc)
    end
end
