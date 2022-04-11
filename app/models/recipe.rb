class Recipe < ApplicationRecord

    belongs_to :user
    has_many :comments
    validates :image, presence: true
    validates :name, presence: true
end
