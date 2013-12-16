require 'rack'
require 'thin'

require './sample_routes.rb'
require './rack_request.rb'

Rack::Handler::Thin.run(RackRequest.new)
