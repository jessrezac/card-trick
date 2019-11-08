class Stack < ApplicationRecord
    belongs_to :user
    has_many :cards
    accepts_nested_attributes_for :cards

    has_one_attached :thumbnail

end
