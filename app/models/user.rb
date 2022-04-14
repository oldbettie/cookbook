class User < ApplicationRecord
    has_secure_password
    has_many :recipes, dependent: :destroy
    has_many :comments
    has_many :likes
    
    #-----user has to have unique password and email-----
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
end
