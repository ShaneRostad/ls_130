### Purpose of Core Tools

The purpose of Ruby tools and how they work together is something we should be very aware of.

##### RVM
At the top level, we have the Ruby Version Manager -- it controls multiple installations of Ruby and all the other tools.

The two major ruby version managers are RVM and rbenv. The main purpose of these tools is allow you to run different versions of Ruby for different projects.

Often your team will standardize a project to one version of Ruby or another. You want to make sure you're using that version of Ruby (say 2.3.1) and not the updated 2.5.3 version.

We can then set default Ruby versions for specific directories and projects. This way we can be sure we're using features of Ruby that are compatible with the project we're working on.


##### Gems
RubyGems, often just called Gems, are packages of code that you can download, install, and use in your Ruby programs or from the command line.

With each installation of Ruby, you can have multiple Gems -- even thousands of Gems if you want. Each Gem becomes accessible to the Ruby version under which it is installed.


##### Bundler
Bundler is a dependency manager for Ruby that makes handling multiple versions of Ruby and multiple versions of Gems a lot simpler.

A project may need a Ruby version that differs from the default Ruby you set in your RVM. Even if it requires the same version of Ruby, it may need a different version of a RubyGem.

The Bundler Gem is the most widely used dependency manager in the Ruby community.


##### Rake

Rake is another Ruby Gem that we can use to perform repetitive development tasks such as running tests, building databases, packaging and releasing software, etc.

Here are some common Rake tasks that you may encounter:
- Set up required environment by creating directories and files
- Set up and initialize databases
- Run tests
- Package your application and all of its files for distribution
- Install the application
- Perform common Git tasks
- Rebuild certain files and directories (assets) based on changes to other files and directories

Rake uses a file name `Rakefile` that lives in your project directory; this file describes the tasks that Rake can perform for your project, and how to perform those tasks. For example:

```ruby
desc 'Say hello'
task :hello do
  puts "Hello there. This is the `hello` task."
end

desc 'Say goodbye'
task :bye do
  puts 'Bye now!'
end

desc 'Do everything'
task :default => [:hello, :bye]
```
