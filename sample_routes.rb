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

  get '/set_session' do
    session[:id] = 4
    "Session set: #{session[:id]}"
  end

  get '/read_session' do
    "The session id is #{session[:id]}"
  end

  put '/put' do
    #should replace a resource
  end

  delete '/delete' do
    #delete something
  end

  #helpers need to be defined as class methods
  def self.test_helper
    "helper text"
  end

end

