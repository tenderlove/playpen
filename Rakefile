# -*- ruby -*-

require 'rubygems'
require 'hoe'
gem 'rake-compiler', '>= 0.4.1'
require "rake/extensiontask"

Hoe.spec 'playpen' do |s|
  developer('Aaron Patterson', 'aaron@tenderlovemaking.com')
  developer('Evan Phoenix', 'evan@fallingsnow.net')
  self.readme_file   = 'README.rdoc'
  self.history_file  = 'CHANGELOG.rdoc'
  self.extra_rdoc_files  = FileList['*.rdoc']
  self.spec_extras = { :extensions => ["ext/playpen/extconf.rb"] }

  Rake::ExtensionTask.new s.name, spec do |ext|
    ext.lib_dir = File.join(*['lib', s.name, ENV['FAT_DIR']].compact)
  end
end

task :test => :compile

# vim: syntax=ruby
