class CreateIngredientMeasures < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredient_measures do |t|
      t.string :ingredient_name
        t.string :measurement_unit
        t.float :measurement_amount
        t.belongs_to :ingredient

      t.timestamps

    end
  end
end
