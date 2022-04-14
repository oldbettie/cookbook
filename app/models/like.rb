class Like < ApplicationRecord
  #-----only allows a user to like the post once-----
  validates :user_id, uniqueness: { scope: :recipe_id }

  # might need to add optional true for after deleting a user
  belongs_to :user
  belongs_to :recipe
end
