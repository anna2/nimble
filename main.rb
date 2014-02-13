require 'rack'

module Nimble

  class Main
    @@routes = Hash.new { |hash, key| hash[key] = Hash.new }
    class << self
      attr_accessor :routes  

      def get(route, &block)
        @@routes['GET'][route] = block
        puts "#{self.routes}"
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

      def erb(view_name)
        File.dirname(__FILE__) + view_name.to_s + '.erb'
      end

      def call(env)
        request = Rack::Request.new(env)
        block = @@routes[request.request_method][request.path_info]
        if block
          puts "Block: #{block}"
          puts "PARAMS: #{request.params}"
          params = request.params
          response = block.call(params)
          [200, {}, [response]]
        else
          [404, {}, ["Page not found"]]
        end
      end
    end
  end

end
