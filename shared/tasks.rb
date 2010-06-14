require File.expand_path("../../merb-core/lib/merb-core/version.rb", __FILE__)

module Rake::TaskManager
  def rm_task(task)
    @tasks.delete(task)
  end
end

def rm_task(task)
  Rake.application.rm_task(task.to_s)
end

@@_project_name = Dir.pwd.split("/").last

def self.project_name(name)
  @@_project_name = name
end

def gem_command(command)
  sh "#{RUBY} -S gem #{command}"
end

def rake_command(command)
  sh "#{RUBY} -S rake #{command}"
end

desc "Build project gem"
task :build do
  gem_command "build #@@_project_name.gemspec"
end

desc "Build and install project gem"
task :install => :build do
  gem_command "install -l ./#@@_project_name-#{Merb::VERSION}.gem --no-rdoc --no-ri"
end

