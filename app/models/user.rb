class User < ApplicationRecord
    has_secure_password
    has_many :recipes
    has_many :comments
    has_many :likes
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
end
