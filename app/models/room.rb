class Room < ApplicationRecord
    has_many :rentals, dependent: :destroy
    # enum :available, [:true, :false]
    def all_rooms
        room.order(number: :desc)
    end
end
