class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :recipe, foreign_key: true

      t.timestamps
    end
    add_index :likes, [:user_id, :recipe_id], unique: true
  end
end
