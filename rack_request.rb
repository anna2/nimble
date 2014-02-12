class RackRequest < Nimble::Main
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
