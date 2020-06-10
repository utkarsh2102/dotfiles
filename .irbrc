require 'wirb'
Wirb.start
Wirb.load_schema(:ultra)

require 'irb/completion'

IRB.conf[:PROMPT][:CUSTOM] = {
  :PROMPT_I => " \e[90m%3n ⎸\e[0m",
  :PROMPT_S => "\e[31m%l\e[90m%3n ⎸\e[0m",
  :PROMPT_C =>  "\e[31m…\e[90m%3n ⎸\e[0m",
  :PROMPT_N =>  "\e[31m,\e[90m%3n ⎸\e[0m",
  :RETURN =>    "\e[90m   - ⎸\e[0m%s\n"
}
IRB.conf[:PROMPT_MODE] = :CUSTOM
IRB.conf[:AUTO_INDENT] = false
IRB.conf[:IGNORE_SIGINT] = true
