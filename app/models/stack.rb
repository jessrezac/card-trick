class Stack < ApplicationRecord
    belongs_to :user
    has_many :cards, dependent: :destroy
    accepts_nested_attributes_for :cards, allow_destroy: true

    has_one_attached :thumbnail

    scope :by_card_count, -> {joins(:cards).group('cards.stack_id').order("count(cards.stack_id) DESC")}
end
