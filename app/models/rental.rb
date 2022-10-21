class Rental < ApplicationRecord
    belongs_to :room

    # def checkout_time
    #     total = self.number_of_days
    # end
    
end