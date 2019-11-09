class Card < ApplicationRecord
    belongs_to :stack
    has_one_attached :front_image
    has_one_attached :back_image

    def next
        Card.where('stack_id = ?', self.stack_id).where('id > ?', self.id).first
    end

    def previous
        Card.where('stack_id = ?', self.stack_id).where('id < ?', self.id).last
    end
end
