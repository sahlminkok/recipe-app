require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  include Devise::Test::IntegrationHelpers
  before(:each) do
    @chef = User.create(name: 'muh', email: 'yes@yes.com', password: 'Sweezy.com1')
    sign_in @chef
    @food = Food.create(name: 'pizza', measurement_unit: 'grams', price: 2.5, quantity: 4, user: @chef)
  end
  describe 'Validations' do
    it 'quantity should be present' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'quantity should be numerical' do
      subject.quantity = 'hello'
      expect(subject).to_not be_valid
    end
    it 'quantity should be greater than or equal to 0' do
      subject.quantity = -1
      expect(subject).to_not be_valid
    end
  end
end