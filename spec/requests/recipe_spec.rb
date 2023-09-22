require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET /index' do
    it 'returns a successful response' do
      get recipes_path
      expect(response).to be_successful
    end

    it 'assigns recipes for the current user to @recipes' do
      user = User.create(name: 'John', email: 'john@example.com', password: 'password')
      recipe = user.recipes.create(name: 'Recipe 1', preparation_time: 30, cooking_time: 60,
                                   description: 'Delicious recipe')

      sign_in user
      get recipes_path

      expect(assigns(:recipes)).to eq([recipe])
    end
  end

  describe 'GET /show' do
    it 'returns a successful response' do
      recipe = Recipe.create(name: 'Recipe 1', preparation_time: 30, cooking_time: 60, description: 'Delicious recipe')

      get recipe_url(recipe)
      expect(response).to be_successful
    end

    it 'assigns the correct recipe to @recipe' do
      recipe = Recipe.create(name: 'Recipe 1', preparation_time: 30, cooking_time: 60, description: 'Delicious recipe')

      get recipe_url(recipe)
      expect(assigns(:recipe)).to eq(recipe)
    end

    it 'eager loads associated foods for the recipe' do
      recipe = Recipe.create(name: 'Recipe 1', preparation_time: 30, cooking_time: 60, description: 'Delicious recipe')
      food1 = recipe.foods.create(name: 'Food 1')
      food2 = recipe.foods.create(name: 'Food 2')

      get recipe_url(recipe)

      expect(assigns(:recipe_foods)).to eq([food1, food2])
    end
  end

  describe 'GET /new' do
    it 'returns a successful response' do
      get new_recipe_url
      expect(response).to be_successful
    end

    it 'assigns a new recipe to @recipe' do
      get new_recipe_url
      expect(assigns(:recipe)).to be_a_new(Recipe)
    end
  end

  describe 'POST /create' do
    context 'with valid attributes' do
      it 'creates a new recipe' do
        user = User.create(name: 'John', email: 'john@example.com', password: 'password')
        sign_in user

        expect do
          post recipes_path,
               params: { recipe: { name: 'Recipe 1', preparation_time: 30, cooking_time: 60,
                                   description: 'Delicious recipe' } }
        end.to change(Recipe, :count).by(1)

        expect(response).to redirect_to(recipe_path(Recipe.last))
        expect(flash[:notice]).to eq('Recipe created successfully!')
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new recipe' do
        user = User.create(name: 'John', email: 'john@example.com', password: 'password')
        sign_in user

        expect do
          post recipes_path,
               params: { recipe: { name: '', preparation_time: nil, cooking_time: nil,
                                   description: 'Delicious recipe' } }
        end.not_to change(Recipe, :count)

        expect(response).to render_template(:new)
        expect(flash[:alert]).to eq('Recipe could not be created')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'deletes a recipe' do
      user = User.create(name: 'John', email: 'john@example.com', password: 'password')
      recipe = user.recipes.create(name: 'Recipe 1', preparation_time: 30, cooking_time: 60,
                                   description: 'Delicious recipe')
      sign_in user

      expect do
        delete recipe_url(recipe)
      end.to change(Recipe, :count).by(-1)

      expect(response).to redirect_to(recipes_path)
      expect(flash[:notice]).to eq('Recipe deleted successfully!')
    end

    it 'redirects to recipes path if recipe could not be deleted' do
      user = User.create(name: 'John', email: 'john@example.com', password: 'password')
      recipe = user.recipes.create(name: 'Recipe 1', preparation_time: 30, cooking_time: 60,
                                   description: 'Delicious recipe')
      sign_in user

      allow_any_instance_of(Recipe).to receive(:destroy).and_return(false)

      delete recipe_url(recipe)

      expect(response).to redirect_to(recipes_path)
      expect(flash[:alert]).to eq('Error: Recipe could not be deleted')
    end
  end

  describe 'PATCH /toggle_public' do
    it 'toggles the public status of a recipe' do
      recipe = Recipe.create(name: 'Recipe 1', preparation_time: 30, cooking_time: 60, description: 'Delicious recipe')

      expect do
        patch toggle_public_recipe_url(recipe)
        recipe.reload
      end.to change(recipe, :public).from(false).to(true)

      expect(response).to redirect_to(recipe_path(recipe))
      expect(flash[:notice]).to eq('Recipe public status updated successfully!')
    end

    it 'renders error message if public status could not be updated' do
      recipe = Recipe.create(name: 'Recipe 1', preparation_time: 30, cooking_time: 60, description: 'Delicious recipe')

      allow_any_instance_of(Recipe).to receive(:update).and_return(false)

      patch toggle_public_recipe_url(recipe)

      expect(response).to redirect_to(recipe_path(recipe))
      expect(flash[:alert]).to eq('Error: Recipe public status could not be updated')
    end
  end
end
