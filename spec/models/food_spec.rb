require 'rails_helper'

RSpec.describe Food, type: :model do
  include Devise::Test::IntegrationHelpers
  before :each do
    @chef = User.create(name: 'muh', email: 'yes@yes.com', password: 'Sweezy.com1')
    sign_in @chef
    subject { Food.create(name: 'jolof rice', measurement_unit: 'grams', price: 2.5, quantity: 4, user: @chef) }
  end

  describe 'Validations' do
    it 'name should be present' do
      subject.name = ''
      expect(subject).to_not be_valid
    end
    it 'measurement_unit should be present' do
      subject.measurement_unit = nil
      expect(subject).to_not be_valid
    end
    it 'price should be present' do
      subject.price = nil
      expect(subject).to_not be_valid
    end
    it 'quantity should be present' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'price and quantity should be numeric' do
      expect(subject).to_not be_valid unless subject.price.is_a?(Numeric) && subject.quantity.is_a?(Numeric)
    end

    it 'price and quanity should be greater than or equals to zero' do
      subject.price = -1
      subject.quantity = -2
      expect(subject).to_not be_valid
    end
    it 'quanity should be an integer' do
      subject.quantity = 2.2
      expect(subject).to_not be_valid
    end
  end
end