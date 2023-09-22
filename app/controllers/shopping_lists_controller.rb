class ShoppingListsController < ApplicationController
  def index
    @current_user = current_user
    @foods = []
    @total_price = 0

    current_user.recipes.includes([:recipe_foods]).each do |recipe|
      process_recipe(recipe)
    end

    @foods.each { |f| @total_price += f[:price] }
  end

  private

  def process_recipe(recipe)
    recipe.recipe_foods.each do |food|
      q = RecipeFood.find_by(food_id: food.id)&.quantity
      f = current_user.foods.find_by(id: food.id)

      next unless valid_food?(f, q)

      @foods << {
        name: f.name,
        quantity: f.quantity - 1,
        price: f.price * (f.quantity - 1)
      }
    end
  end

  def valid_food?(food, quantity)
    food && (food.quantity - quantity).negative?
  end
end
