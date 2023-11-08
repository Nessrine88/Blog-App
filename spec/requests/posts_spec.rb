require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    it 'returns a successful response' do
      get posts_path
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get posts_path
      expect(response).to render_template(:index)
    end

    it 'displays the correct placeholder text' do
      get posts_path
      expect(response.body).to include('All posts page of a given user')
    end

    it 'returns the expected number of posts' do
      # Create some posts for testing
      Post.create(title: 'Post 1', content: 'Content 1')
      Post.create(title: 'Post 2', content: 'Content 2')

      get posts_path
      expect(assigns(:posts)).to be_an_instance_of(ActiveRecord::Relation)
      expect(assigns(:posts)).to have(2).items
    end
  end
end
