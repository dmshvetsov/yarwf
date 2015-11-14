require 'minitest_helper'

module Yarwf
  class ControllerTest < Minitest::Test

    def dummy_env
      {
        'PATH_INFO' => '/pages/about'
      }
    end

    def test_env_attr_reader
      controller = Controller.new({})
      assert controller.respond_to?(:env)
    end

    def test_access_env_attr
      controller = Controller.new(dummy_env)
      assert_equal controller.env, dummy_env
    end

  end
end
