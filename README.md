#Nimble

Nimble is a lightweight Ruby web framework build on top of Rack. To get started, ```gem install nimble_framework```. Then:

1. Create a .rb file and ```require 'nimble_framework'```. Then create an app class that inherits from Nimble::Main and start declaring routes.


2. Create a config.ru that requires your .rb file and then type ```run App```. But, substituting for App the name of your app class. An example:

```
#config.ru

require './sample_routes.rb'
use Rack::Session::Cookie, :secret => 'change_me'
run App
```


3. Nimble will look for erb files in ProjectName>/views/ by default.

4. Use ```rackup``` from the command line to see your app running locally.

##Sample Usage:

```
require 'nimble_framework'

class App < Nimble::Main

  #params can be accessed like so:
  get '/' do
    "Hello world, #{params['id']}"
  end

  #the erb method renders a <file>.html.erb from the view folder
  get '/happy' do
   erb :happy
  end

  #pass params or other local variables to the view
  #by passing a hash  as the second argument
  #to erb
  #in the view, you can access the locals as in
  #this example: <p>Hi, <%= locals["firstname"]  %></p>
  post '/happy' do
    erb :greet, params
  end

  get '/redirect' do
    redirect_to('/happy')
  end

  #to use cookie-based sessions, be sure to
  #include the following in your config.ru
  #file: use Rack::Session::Cookie, :secret => 'change_me'
  get '/set_session' do
    session[:id] = 5
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
```
