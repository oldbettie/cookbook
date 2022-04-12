class Recipe < ApplicationRecord

    belongs_to :user, optional: true
    has_many :comments, dependent: :destroy
    validates :image, presence: true
    validates :name, presence: true
end
