require 'rails_helper'

RSpec.describe Food, type: :model do
  include Devise::Test::IntegrationHelpers

  before :each do
    @chef = User.create(name: 'muh', email: 'yes@yes.com', password: 'Sweezy.com1')
    sign_in @chef
    @food = Food.new(
      name: 'jolof rice',
      measurement_unit: 'grams',
      price: 2.5,
      quantity: 4,
      user: @chef
    )
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(@food).to be_valid
    end

    it 'requires a name' do
      @food.name = ''
      expect(@food).to_not be_valid
      expect(@food.errors[:name]).to include("can't be blank")
    end

    it 'requires a measurement unit' do
      @food.measurement_unit = nil
      expect(@food).to_not be_valid
      expect(@food.errors[:measurement_unit]).to include("can't be blank")
    end

    it 'requires a price' do
      @food.price = nil
      expect(@food).to_not be_valid
      expect(@food.errors[:price]).to include("can't be blank")
    end

    it 'requires price to be numeric' do
      @food.price = 'abc'
      expect(@food).to_not be_valid
      expect(@food.errors[:price]).to include('is not a number')
    end

    it 'requires quantity to be numeric' do
      @food.quantity = 'def'
      expect(@food).to_not be_valid
      expect(@food.errors[:quantity]).to include('is not a number')
    end

    it 'requires price to be greater than or equal to zero' do
      @food.price = -1
      expect(@food).to_not be_valid
      expect(@food.errors[:price]).to include('must be greater than or equal to 0')
    end

    it 'requires quantity to be greater than or equal to zero' do
      @food.quantity = -2
      expect(@food).to_not be_valid
      expect(@food.errors[:quantity]).to include('must be greater than or equal to 0')
    end

    it 'requires quantity to be an integer' do
      @food.quantity = 2.2
      expect(@food).to_not be_valid
      expect(@food.errors[:quantity]).to include('must be an integer')
    end
  end
end
