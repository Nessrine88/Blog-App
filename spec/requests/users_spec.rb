require 'rails_helper'

describe 'GET /index' do
  it 'includes the correct placeholder' do
    get '/users/1'
    puts response.status
    placeholder = 'Single user page'
    expect(response.body).to match(/#{placeholder}/)
  end
end
