# A DSL for mapping routes to controller actions
require_relative './test_app'

App = TestApp.new

App.get '/' do
  "Hello world"
end

App.get '/happy' do
  App.happy
end

App.post '/params' do |arg|
  App.greet(arg['name'])
end

# App.get '/view' do
#   App.erb :view
# end

# App.put '/' do
#   #should upload a new file
# end

# App.delete '/' do

# end