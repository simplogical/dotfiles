require 'rake'
require 'erb'
require 'rbconfig'
WINDOZE = Config::CONFIG['host_os'] =~ /mswin|mingw/

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README.rdoc LICENSE].include? file
 
    if File.exist?(File.join(ENV['HOME'], dest(file)))
      if File.identical?(file, File.join(ENV['HOME'], dest(file)))
        puts "identical ~/#{dest(file)}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/#{dest(file)}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/#{dest(file)}"
        end
      end
    else
      link_file(file)
    end
  end
end

def replace_file(file)
  if WINDOZE
    if File.directory?(File.join(ENV['HOME'], dest(file)))
      system %Q{rd /s/q "%HOMEPATH%/#{dest(file)}"}
    else
      system %Q{del /q "%HOMEPATH%/#{dest(file)}"}
    end
  else
    system %Q{rm -rf "$HOME/#{dest(file)}"}
  end
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/#{dest(file)}"
    File.open(File.join(ENV['HOME'], "#{dest(file)}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/#{dest(file)}"
    if WINDOZE
      if File.directory?(File.join(ENV['HOME'], dest(file)))
        system %Q{cmd.exe /c "mklink /d \"%HOMEPATH%/#{dest(file)}\" \"%CD%/#{file}\""}
      else
        system %Q{cmd.exe /c "mklink \"%HOMEPATH%/#{dest(file)}\" \"%CD%/#{file}\""}
      end
    else
      system %Q{ln -s "$PWD/#{file}" "$HOME/#{dest(file)}"}
    end
  end
end

def dest(file)
  if WINDOZE && file == "vim"
    "vimfiles"
  else
    ".#{file.sub('.erb','')}"
  end
end

