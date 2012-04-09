require 'erb'
template = ERB.new(File.read("template.erb"))

Dir.glob("pages/*.html").each do |page|
  content = File.read(page)
  File.open(File.basename(page), 'w') { |f| f.write(template.result(binding)) }
end