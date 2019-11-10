class User < ApplicationRecord
    
    has_secure_password
    has_many :stacks
    has_many :attempts
    has_many :cards, through: :attempts

    validates :email, uniqueness: true

end
