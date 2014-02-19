#Nimble

Nimble is a lightweight Ruby web framework built on top of Rack. To get started, ```gem install nimble_framework```. Then:

1. Create a .rb file and ```require 'nimble_framework'```. Then create an app class that inherits from Nimble::Main and start declaring routes.


2. Create a config.ru that requires your .rb file and then type ```run App```. But, substituting for App the name of your app class. An example:

```
#config.ru

require './sample_routes.rb'
use Rack::Session::Cookie, :secret => 'change_me'
run App
```

 Nimble will look for erb files in ProjectName>/views/ by default. Use ```rackup``` from the command line to see your app running locally.

##Sample Usage:

```
require 'nimble_framework'

class App < Nimble::Main

  # Params can be accessed like so:

  get '/' do
    "Hello world, #{params['id']}"
  end

  # The erb method renders a <file>.html.erb from the view folder

  get '/happy' do
   erb :happy
  end

  # Pass params or other local variables to the view
  # by passing a hash as the second argument to erb.
  # In the view, you can access the locals as in
  # this example: <p>Hi, <%= locals["firstname"]  %></p>

  post '/happy' do
    erb :greet, params
  end

  get '/redirect' do
    redirect_to('/happy')
  end

  # To use cookie-based sessions, be sure to
  # include the following in your config.ru
  # file: use Rack::Session::Cookie, :secret => 'change_me'

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

  # Helpers need to be defined as class methods:

  def self.test_helper
    "helper text"
  end

end
```
