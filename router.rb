class Router
  attr_accessor :routes

  def initialize
    @routes = Hash.new { |hash, key| hash[key] = Hash.new }
  end

  def get(route, &block)
    @routes['GET'][route] = block
    puts "#{@routes}"
  end

  def post(route, &block)
    @routes['POST'][route] = block
  end

  def put(route, &block)
    @routes['PUT'][route] = block
  end

  def delete(route, &block)
    @routes['DELETE'][route] = block
  end

  def erb(view_name)
    @views[view_name]
  end
end
