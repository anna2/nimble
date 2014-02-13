require_relative './main'

class App < Nimble::Main

  get '/' do |params|
    "Hello world #{params["p"]}"
  end

  get '/happy' do
   erb :happy
  end

  post '/happy' do |params|
    erb :greet, params
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
