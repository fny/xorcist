require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

gemspec = Gem::Specification.load(File.expand_path('xorcist.gemspec',  __FILE__))

if RUBY_ENGINE == 'jruby'
  require 'rake/javaextensiontask'
  Rake::JavaExtensionTask.new('xorcist', gemspec) do |ext|
    ext.release = '8'
  end
  task :default => :test
else
  require 'rake/extensiontask'
  Rake::ExtensionTask.new('xorcist', gemspec) do |ext|
    ext.lib_dir = 'lib/xorcist'
  end
  task :default => [:compile, :test]
end

task :clean do
  Dir['./**/*.{bundle,jar,o,so}'].each do |path|
    puts "Deleting #{path} ..."
    File.delete(path)
  end
  FileUtils.rm_rf('./pkg')
  FileUtils.rm_rf('./tmp')
end
