class Recipe < ApplicationRecord

    belongs_to :user, optional: true
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    
    #-----recipe has to have name and image-----
    validates :image, presence: true
    validates :name, presence: true
end
