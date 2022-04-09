class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.text :name
      t.text :ingredients
      t.text :instructions
      t.text :image
      t.text :video
      t.integer :user_id
      t.text :category
      t.text :region

      t.timestamps
    end
  end
end
