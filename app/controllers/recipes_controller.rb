class RecipesController < ApplicationController
  before_action :authenticate_user!
  def index
    @recipes = current_user.recipes
  end

  def show
  @recipe = current_user.recipes.find(params[:id])
  end

  def destroy
    @recipe = current_user.recipes.find_by(id: params[:id])

    if @recipe.destroy
      redirect_to recipes_path, notice: 'Recipe deleted successfully!'
    else
      redirect_to recipes_path, alert: 'Error: Recipe could not be deleted'
    end
  end
end
