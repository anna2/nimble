require_relative './main'

class App < Nimble::Main

  get '/' do
    "Hello world"
  end

  get '/happy' do
   erb :happy
  end

  post '/happy' do |params|
    erb :greet, params
  end

  get '/helper' do
    "Display the #{test_helper}"
  end

  # put '/' do
  #   #should upload a new file
  # end

  # delete '/' do

  # end

  #helpers need to be defined as class methods
  def self.test_helper
    "helper text"
  end

end

