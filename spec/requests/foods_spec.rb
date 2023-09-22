require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: 'muh', email: 'yes@yes.com', password: 'Sweezy.com1')
    sign_in @user
  end
  describe 'GET /index' do
    it 'returns a successful response' do
      get root_path
      expect(response).to be_successful
    end

    it 'renders the template accurately' do
      get root_path
      expect(response).to render_template('index')
    end
  end

  describe 'GET /new' do
    it 'returns a successful response' do
      get new_food_path
      expect(response).to be_successful
    end

    it 'renders the template accurately' do
      get new_food_path
      expect(response).to render_template('new')
    end
  end

  describe 'POST /create' do
    context 'with valid attributes' do
      it 'creates a new food' do
        expect do
          post foods_path,
               params: { food: { name: 'new_food', measurement_unit: 'grams', price: 2.5, quantity: 4, user: @chef } }
        end.to change(Food, :count).by(1)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new food with invalid params' do
        post foods_path, params: { food: { name: '', measurement_unit: 'grams', price: '', quantity: 4, user: @chef } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'deletes a food' do
      food = Food.create(name: 'food_to_delete', measurement_unit: 'grams', price: 2.5, quantity: 4, user: @user)

      expect do
        delete food_path(food)
      end.to change(Food, :count).by(-1)

      expect(response).to redirect_to(root_path)
    end
  end
end
