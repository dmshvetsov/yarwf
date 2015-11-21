require 'minitest_helper'

class AutoloadingTest < Minitest::Test

  def setup
    $LOAD_PATH << File.expand_path('../support/constants/', __FILE__)
  end

  def teardown
    Object.send(:remove_const, :SimpleClassConstant) if Object.const_defined?(:SimpleClassConstant)
  end

  def test_autoload_constant
    refute Object.const_defined?('SimpleClassConstant'), 'there is no SimpleClassConstant'
    SimpleClassConstant.new # call constant
    assert Object.const_defined?('SimpleClassConstant')
  end

  def test_return_constant
    refute Object.const_defined?('SimpleClassConstant'), 'there is no SimpleClassConstant'
    result = SimpleClassConstant # call constant
    assert_equal SimpleClassConstant, result
  end

  def test_autoload_nonexistent_constant
    exp = assert_raises(LoadError) {
      AbraCadabra
    }
    assert 'cannot load such file -- abra_cadabra', exp.message
  end

end
