ENV['RACK_ENV'] = 'test'

require 'server'
require 'test/unit'
require 'rack/test'

class HelloWorldTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_says_hello_world
    get '/'
    assert last_response.ok?
    assert_equal 'Hello World', last_response.body
  end

  def test_get_webhook
    get '/webhook', :name => 'github'
    assert last_response.body.include?('github')
  end

  def test_post_webhook
    post {:webhook_id => 232, :repo => 'foo'}, '/webhook'
    asert last_response.body.include?('success')
  end
end
