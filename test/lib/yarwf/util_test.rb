require 'minitest_helper'

module Yarwf
  class UtilTest < Minitest::Test

    def subject
      Yarwf
    end

    def test_to_underscore
      result = subject.to_underscore('AbraCadabra')
      assert_equal 'abra_cadabra', result
    end

    def test_namespace_to_underscore
      result = subject.to_underscore('AbraModule::CadabraClass')
      assert_equal 'abra_module/cadabra_class', result
    end

  end
end
