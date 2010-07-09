require 'rake'
require 'erb'

desc "install the dit files into the user's home directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README.rdoc LICENSE].include? file

    if File.exist?(File.join(ENV['HOME'], nice(file)))
      if File.identical? file, File.join(ENV['HOME'], nice(file))
        puts "identical ~/#{nice(file)}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/#{nice(file)}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/#{nice(file)}"
        end
      end
    else
      link_file(file)
    end
  end
end

def replace_file(file)
  system %Q{rm -rf "$HOME/#{nice(file)}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/#{nice(file)}"
    File.open(File.join(ENV['HOME'], nice(file)), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

def nice(file)
  ".#{file.sub('.erb', '')}"
end
