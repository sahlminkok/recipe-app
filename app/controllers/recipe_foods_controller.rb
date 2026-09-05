class RecipeFoodsController < ApplicationController
  before_action :find_recipe_food, only: %i[destroy]
  before_action :find_recipe, only: %i[new create]

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new(recipe: @recipe)
    @foods = Food.all
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe = @recipe

    if @recipe_food.save
      redirect_to recipe_path(@recipe), notice: 'Food added to the recipe successfully!'
    else
      @foods = Food.all
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.find(params[:id])

    if @recipe_food.destroy
      redirect_to recipe_path(@recipe), notice: 'Food removed from the recipe successfully!'
    else
      redirect_to recipe_path(@recipe), alert: 'Error: Food could not be removed from the recipe'
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity, :recipe_id)
  end

  def find_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
    @recipe = @recipe_food.recipe
  end

  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
