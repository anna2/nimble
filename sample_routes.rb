require_relative './main'

class App < Nimble::Main

  get '/' do
    "Hello world"
  end

  get '/happy' do
   erb :happy
  end

  post '/params' do |arg|
    greet(arg['name'])
  end

  # get '/view' do
  #   erb :view
  # end

  # App.put '/' do
  #   #should upload a new file
  # end

  # App.delete '/' do

  # end

end
