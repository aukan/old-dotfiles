require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  Dir['*'].each do |file|
    next if %w[Rakefile README.rdoc LICENSE config].include? file
    install file
  end

  %w[.config].each do |subdir|
    system "mkdir -p #{subdir}"
    Dir[subdir.gsub(/^\./, '')].each do |file|
      install file, subdir + "/"
    end
  end
end

def install(file, base_path = ".")
  replace_all = false
  if File.exist?(File.join(ENV['HOME'], base_path, "#{file.sub('.erb', '')}"))
    if File.identical? file, File.join(ENV['HOME'], base_path, "#{file.sub('.erb', '')}")
      puts "identical ~/#{base_path}#{file.sub('.erb', '')}"
    elsif replace_all
      replace_file(file, base_path)
    else
      print "overwrite ~/#{base_path}#{file.sub('.erb', '')}? [ynaq] "
      case $stdin.gets.chomp
      when 'a'
        replace_all = true
        replace_file(file, base_path)
      when 'y'
        replace_file(file, base_path)
      when 'q'
        exit
      else
        puts "skipping ~/#{base_path}#{file.sub('.erb', '')}"
      end
    end
  else
    link_file(file, base_path)
  end
end

def replace_file(file, base_path = ".")
  system %Q{rm -rf "$HOME/#{base_path}#{file.sub('.erb', '')}"}
  link_file(file, base_path)
end

def link_file(file, base_path = ".")
  if file =~ /.erb$/
    puts "generating ~/#{base_path}#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], base_path, "#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/#{base_path}#{file}"
    system %Q{ln -s "$PWD/#{base_path.gsub(/^\./, '')}#{file}" "$HOME/#{base_path}#{file}"}
  end
end
