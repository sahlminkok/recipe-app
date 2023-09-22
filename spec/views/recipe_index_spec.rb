require 'rails_helper'

RSpec.describe 'Recipes', type: :feature do
  include Devise::Test::IntegrationHelpers
  describe 'index' do
    before(:each) do
      @user = User.create(name: 'Ndlovu', email: 'muhm@mail.com', password: 123_456)
      sign_in @user
      @recipe = Recipe.create(user: @user, name: 'papa', preparation_time: 2, cooking_time: 1,
                              description: 'kasi dish', public: true)
      visit all_recipes_path
    end

    it 'renders name of recipe' do
      expect(page).to have_content(@recipe.name)
    end

    it 'renders description of the recipe' do
      expect(page).to have_content(@recipe.description)
    end


      it 'renders remove button' do
      expect(page).to have_link('Delete', href: recipe_path(@recipe))
    end

    it 'renders a button to create a new recipe' do
      expect(page).to have_link('Create New Recipe', href: new_recipe_path)
    end

    it 'redirects to the new recipe form when the create new recipe button is clicked' do
      click_link('Create New Recipe', href: new_recipe_path)
      expect(page).to have_current_path(new_recipe_path)
    end
  end
end