require 'rack'
require 'tilt'
require 'erb'

module Nimble

  class Main
    @@routes = Hash.new { |hash, key| hash[key] = Hash.new }

    class << self
      attr_accessor :routes  

      def get(route, &block)
        @@routes['GET'][route] = block
      end

      def post(route, &block)
        @@routes['POST'][route] = block
      end

      def put(route, &block)
        @@routes['PUT'][route] = block
      end

      def delete(route, &block)
        @@routes['DELETE'][route] = block
      end

      def erb(view_name, locals = {})
        path = ::File.join("views", "#{view_name.to_s}.html.erb")
        template = Tilt.new(path)
        template.render(nil, locals)
      end

      def session
        @request.session
      end

      def params
        @params
      end

      def redirect_to(path)
        @response['Location'] = path
        @response.status = 303
        "Redirect!"
      end

      def call(env)
        @request = Rack::Request.new(env)
        block = @@routes[@request.request_method][@request.path_info]
        if block
          @params = @request.params
          @response = Rack::Response.new
          @response.body = [block.call]
          @response.header ||= {}
          @response.status ||= 200
          @response.finish
        else
          [404, {}, ["Page not found"]]
        end
      end
    end
  end



end
