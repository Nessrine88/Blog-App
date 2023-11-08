require 'rails_helper'

describe 'GET /index' do
  it 'returns a successful response' do
    get users_url
    puts response.status
    expect(response).to be_successful
  end

  it 'renders a correct template' do
    get users_url
    puts response.status
    template = File.read('app/views/users/index.html.erb')
    expect(response.body).to match(/#{template}/)
  end

  it 'includes the correct placeholder' do
    get users_url
    puts response.status
    placeholder = 'All users page'
    expect(response.body).to match(/#{placeholder}/)
  end
end

describe 'GET /show' do
  it 'returns a successful response' do
    get '/users/1'
    puts response.status
    expect(response).to be_successful
  end

  it 'renders a correct template' do
    get '/users/1'
    puts response.status
    template = File.read('app/views/users/show.html.erb')
    expect(response.body).to match(/#{template}/)
  end

  it 'includes the correct placeholder' do
    get '/users/1'
    puts response.status
    placeholder = 'Single user page'
    expect(response.body).to match(/#{placeholder}/)
  end
end
