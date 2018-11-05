# imagine there's an IngredientMeasure
class IngredientMeasure
  METRICS = [
    "tsp",
    "tbsp",
    "cup"
  ]
  belong_to :ingredient
    belong_to :recipe


    before_save :set_ingredient

    def ingredient_name=(name)
      @ingredient_name = name
    end

    def ingredient_name
      @ingredient_name ||= ingredient ? ingredient.name : ""
    end

    protected
    def set_ingredient
      if @ingredient_name
        self.ingredient = Ingredient.find_or_create_by!(name: @ingredient_name)
      end
    end
end
