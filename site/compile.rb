#!/usr/bin/env ruby

require 'erb'

def compile
  template = ERB.new(File.read("template.erb"))

  Dir.glob("pages/*.html").each do |page|
    content = File.read(page)
    File.open(File.basename(page), 'w') { |f| f.write(template.result(binding)) }
  end
end

if ARGV.first == "development"
  loop { compile and sleep 2 }
else
  compile
end