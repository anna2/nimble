require './sample_routes.rb'

use Rack::Session::Cookie, :secret => 'change_me'

run App

