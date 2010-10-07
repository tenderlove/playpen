require 'playpen/playpen'

class Playpen
  VERSION = '1.0.0'

  def initialize
    @commands = []
  end

  def apply
    @commands.each do |command|
      self.class.sandbox_init(command, Playpen::SANDBOX_NAMED)
    end
  end

  constants.each do |const|
    class_eval(<<-eoruby, __FILE__, __LINE__ + 1)
      def #{const.to_s.downcase}
        @commands << #{const}
        self
      end

      def self.#{const.to_s.downcase}
        new.#{const.to_s.downcase}
      end
    eoruby
  end

  alias :no_writes :no_write
  alias :temporary_writes :temp_only_write
  alias :pure_computation :computation_only
end
