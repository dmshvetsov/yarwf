require_relative '../../minitest_helper'

class SimpleApp < Yarwf::Application
end

module Yarwf
  class ApplicationTest < Minitest::Test

    include Rack::Test::Methods

    def app
      ::SimpleApp.new
    end

    def test_request_response_status
      get "/"

      assert last_response.ok?
    end

    def test_request_response_body
      get "/"

      body = last_response.body
      expected = '<h1>YARWF is up</h1><p>A good day.</p><p><small>Yet another ruby web framework. Just for fun, by shvetsovdm.</small></p>'
      assert_equal body, expected
    end

  end
end
