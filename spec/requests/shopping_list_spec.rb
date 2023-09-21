require 'rails_helper'

RSpec.describe 'ShoppingLists', type: :request do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: 'muh', email: 'yes@yes.com', password: 'Sweezy.com1')
    sign_in @user
  end

  describe 'GET /index' do
    it 'returns a successful response' do
      get shopping_list_index_path
      expect(response).to be_successful
    end

    it 'renders the accurate template' do
      get shopping_list_index_path
      expect(response).to render_template(:index)
    end
  end
end
