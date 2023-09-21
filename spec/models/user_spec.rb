require 'rails_helper'

RSpec.describe User, type: :model do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: 'muh', email: 'yes@yes.com', password: 'Sweezy.com1')
    sign_in @user
  end
  describe 'Validations' do
    it 'name should be present' do
      @user.name = ''
      expect(@user).to_not be_valid
    end
  end
end