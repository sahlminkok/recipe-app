require 'rails_helper'

RSpec.describe Recipe, type: :model do
  include Devise::Test::IntegrationHelpers
  before :each do
    chef = User.create(name: 'muh', email: 'yes@yes.com', password: 'Sweezy.com1')
    sign_in chef
    subject do
      Recipe.create(name: 'recipe 1', preparation_time: 40, cooking_time: 140,
                    description: 'it is the most amazing recipe on the planet', public: true, user: chef)
    end
  end
  describe 'Validations' do
    it 'name should be present' do
      subject.name = ''
      expect(subject).to_not be_valid
    end
    it 'preparation_time should be present' do
      subject.preparation_time = nil
      expect(subject).to_not be_valid
    end
    it 'cooking_time should be present' do
      subject.cooking_time = nil
      expect(subject).to_not be_valid
    end
    it 'description should be present' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'preparation_time and cooking_time should be numeric' do
      unless subject.preparation_time.is_a?(Numeric) && subject.cooking_time.is_a?(Numeric)
        expect(subject).to_not be_valid
      end
    end

    it 'preparation_time and cooking_time should be greater than or equals to zero' do
      subject.preparation_time = -1
      subject.cooking_time = -2
      expect(subject).to_not be_valid
    end
  end
end
