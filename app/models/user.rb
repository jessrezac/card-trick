class User < ApplicationRecord
    has_secure_password
    has_many :stacks
    has_many :cards, through: :stacks
end
