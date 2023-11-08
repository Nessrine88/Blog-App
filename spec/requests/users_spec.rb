require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'returns a successful response' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'displays the correct placeholder text' do
      get users_path
      expect(response.body).to include('All users page')
    end

    it 'returns the expected number of users' do
      # Create some users for testing
      User.create(name: 'User 1')
      User.create(name: 'User 2')

      get users_path
      expect(assigns(:users)).to be_an_instance_of(ActiveRecord::Relation)
      expect(assigns(:users)).to have(2).items
    end
  end
end
