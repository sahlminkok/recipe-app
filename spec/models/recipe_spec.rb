require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:recipe_foods) }
    it { should have_many(:foods).through(:recipe_foods) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:preparation_time).only_integer.is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:cooking_time).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe '#total_food_items' do
    it 'returns the sum of quantities of recipe foods' do
      recipe = Recipe.create(name: 'Recipe 1')
      food1 = Food.create(name: 'Food 1', price: 10)
      food2 = Food.create(name: 'Food 2', price: 20)
      recipe.recipe_foods.create(food: food1, quantity: 2)
      recipe.recipe_foods.create(food: food2, quantity: 3)

      expect(recipe.total_food_items).to eq(5)
    end
  end

  describe '#total_price' do
    it 'returns the sum of prices of recipe foods' do
      recipe = Recipe.create(name: 'Recipe 1')
      food1 = Food.create(name: 'Food 1', price: 10)
      food2 = Food.create(name: 'Food 2', price: 20)
      recipe.recipe_foods.create(food: food1, quantity: 2)
      recipe.recipe_foods.create(food: food2, quantity: 3)

      expect(recipe.total_price).to eq(80) # (2 * 10) + (3 * 20) = 80
    end
  end
end
