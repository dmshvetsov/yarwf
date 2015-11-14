require_relative '../../minitest_helper'

class SimpleApp < Yarwf::Application
end

class SimpleController < Yarwf::Controller
  def a
    'a'
  end
end

module Yarwf
  class ApplicationTest < Minitest::Test

    include Rack::Test::Methods

    def app
      ::SimpleApp.new
    end

    def body
      last_response.body
    end

    def default_response
      '<h1>YARWF is up</h1><p>A good day.</p><p><small>Yet another ruby web framework. Just for fun, by shvetsovdm.</small></p>'
    end

    def test_request_response_status
      get '/'
      assert last_response.ok?
    end

    def test_request_response_body
      get '/'
      assert_equal body, default_response
    end

    def test_deault_response
      get 'abra/cadabra'
      assert_equal body, default_response
    end

    def test_simple_controller_response
      get 'simple/a'
      assert_equal body, 'a'
    end

  end
end
