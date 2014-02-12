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
  end
end

end
