class Attempt < ApplicationRecord
    belongs_to :user
    belongs_to :card

    def self.user_card_count(user)
        Attempt.where('user_id = ?', user).count
    end
end
