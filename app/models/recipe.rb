class Recipe < ApplicationRecord

    belongs_to :user, optional: true

    validates :image, presence: true
    validates :name, presence: true
end
