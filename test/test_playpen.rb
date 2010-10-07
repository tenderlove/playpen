require "test/unit"
require "playpen"

class TestPlaypen < Test::Unit::TestCase
  def test_constant_exists
    assert Playpen::SANDBOX_NAMED, 'yay!'
  end

  def test_no_internet
    assert Playpen::NO_INTERNET, "woop-be-doop!"
  end

  def test_no_network
    assert Playpen::NO_NETWORK, "woop-be-doop!"
  end

  def test_no_write
    assert Playpen::NO_WRITE, "woop-be-doop!"
  end

  def test_temp_only_write
    assert Playpen::TEMP_ONLY_WRITE, "woop-be-doop!"
  end

  def test_computation_only
    assert Playpen::COMPUTATION_ONLY, "woop-be-doop!"
  end

  def test_sanity
    Playpen.sandbox_init(Playpen::NO_INTERNET, Playpen::SANDBOX_NAMED)
  end

  def test_chaining
    x = Class.new(Playpen) do
      class << self
        attr_accessor :args
        def sandbox_init file, flags
          self.args << [file, flags]
        end
      end
      self.args = []
    end
    x.no_internet.no_network.no_writes.temporary_writes.pure_computation.apply
    assert_equal([
      [Playpen::NO_INTERNET, Playpen::SANDBOX_NAMED],
      [Playpen::NO_NETWORK, Playpen::SANDBOX_NAMED],
      [Playpen::NO_WRITE, Playpen::SANDBOX_NAMED],
      [Playpen::TEMP_ONLY_WRITE, Playpen::SANDBOX_NAMED],
      [Playpen::COMPUTATION_ONLY, Playpen::SANDBOX_NAMED],
    ], x.args)
  end
end
