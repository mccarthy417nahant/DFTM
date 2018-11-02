class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.attachment :image
      t.belongs_to :user

      t.timestamps
    end
  end
end
