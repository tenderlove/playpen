require "test/unit"
require "playpen"

class TestPlaypen < Test::Unit::TestCase
  def test_constant_exists
    assert Playpen::SANDBOX_NAMED, 'yay!'
  end

  def test_no_internet
    assert Playpen::NO_INTERNET, "woop-be-doop!"
  end

  def test_sanity
    Playpen.sandbox_init(Playpen::NO_INTERNET, Playpen::SANDBOX_NAMED)
  end
end
