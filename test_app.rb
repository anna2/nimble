require_relative './router'

class TestApp < Router

  def happy
    "This is the happy page."
  end

  def greet(name)
    "Hi, #{name}!"
  end

end