class Recipe < ApplicationRecord

    belongs_to :user, optional: true
    has_many :comments
    validates :image, presence: true
    validates :name, presence: true
end
