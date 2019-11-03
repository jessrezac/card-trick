class Stack < ApplicationRecord
    belongs_to :user
    has_many :cards
    has_one_attached :thumbnail
end
