require 'rails_helper'

RSpec.describe 'Recipes', type: :feature do
  include Devise::Test::IntegrationHelpers

  describe 'index' do
    # ... index tests ...
  end

  describe 'show' do
    before(:each) do
      @user = User.create(name: 'muh', email: 'yes@yes.com', password: 'Sweezy.com1')
      sign_in @user
      @recipe = Recipe.create(user: @user, name: 'Jolof', preparation_time: 2, cooking_time: 1,
                              description: 'Kasi recipe', public: true)
      visit recipe_path(@recipe.id)
    end

    it 'renders name of recipe' do
      expect(page).to have_selector('h1', text: "Recipe #{@recipe.id}")
    end

    it 'renders preparation time' do
      expect(page).to have_content("Preparation time: #{@recipe.preparation_time}")
    end

    it 'renders cooking time' do
      expect(page).to have_content("Cooking time: #{@recipe.cooking_time}")
    end

    it 'renders add ingredient button' do
      expect(page).to have_link('Add Food', href: new_recipe_recipe_food_path(@recipe))
    end

    it 'redirects to add ingredient page' do
      click_link 'Add Food'
      expect(page).to have_current_path(new_recipe_recipe_food_path(@recipe))
    end

    it 'renders shopping list button' do
      expect(page).to have_link('Generate shopping list', href: general_shopping_list_path)
    end
  end
end