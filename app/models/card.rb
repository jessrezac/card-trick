class Card < ApplicationRecord
    belongs_to :stack
    has_one_attached :front_image
    has_one_attached :back_image
end
