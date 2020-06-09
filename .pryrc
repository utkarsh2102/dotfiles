if defined?(Vertical) && Vertical.respond_to?(:set)
  def v(vertical = nil)
    ActiveRecord::Base.logger.silence do
      vertical ||= Vertical.verticals.keys.find { |vt| vt == ENV['CURRENT_VERTICAL'] }
      vertical ||= Vertical.verticals.keys.first
      Vertical.set(vertical) if vertical
    end
  end

  v unless Vertical.set?
end


Pry.config.pager = false

Pry.config.prompt = [
  proc { |obj, nest_level, pry| "\e[34m #{pry.input_ring.count.to_s.rjust 3}\e[90m ⎸\e[0m" },
  proc { |obj, nest_level, pry| "\e[31m…\e[34m#{pry.input_ring.count.to_s.rjust 3}\e[90m ⎸\e[0m" }
]
Pry.config.output_prefix = "\e[34m   -\e[90m ⎸\e[0m"

def pbcopy(str)
  IO.popen('pbcopy', 'r+') { |io| io.puts str }
end

Pry.config.commands.command 'copy', 'Copy to clipboard' do |str|
  pbcopy(str || _pry_.last_result.to_s.chomp)
end

