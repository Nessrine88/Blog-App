require 'rails_helper'
describe 'GET #index' do
  it 'renders a correct template' do
    get '/users/1/posts'
    template = File.read('app/views/posts/index.html.erb')
    expect(response.body).to match(/#{template}/)
  end

  it 'renders a correct template' do
    get '/users/1/posts/1'
    template = File.read('app/views/posts/show.html.erb')
    expect(response.body).to match(/#{template}/)
  end
end
