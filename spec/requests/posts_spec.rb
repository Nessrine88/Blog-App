require 'rails_helper'

describe 'GET /index' do
  it 'returns a successful response' do
    user = User.create!(name: 'User1')
    get "/users/#{user.id}/posts/index"
    expect(response).to be_successful
  end

  it 'renders a correct template' do
    get '/users/1/posts'
    template = File.read('app/views/posts/index.html.erb')
    expect(response.body).to match(/#{template}/)
  end

  it 'includes the correct placeholder' do
    get '/users/1/posts'
    placeholder = 'All posts page of a given user'
    expect(response.body).to match(/#{placeholder}/)
  end
end

describe 'GET /show' do
  it 'returns a successful response' do
    get '/users/1/posts/1'
    expect(response).to be_successful
  end

  it 'renders a correct template' do
    get '/users/1/posts/1'
    template = File.read('app/views/posts/show.html.erb')
    expect(response.body).to match(/#{template}/)
  end

  it 'includes the correct placeholder' do
    get '/users/1/posts/1'
    placeholder = 'Single post page for a given user'
    expect(response.body).to match(/#{placeholder}/)
  end
end
