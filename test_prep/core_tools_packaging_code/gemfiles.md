Bundler uses a file named `Gemfile` to determine the dependencies of your project. The dependencies specified in this file will let other developers know how to run your project.

A `Gemfile` typically needs four main pieces of information:
- Where should Bundler look for Rubygems it needs to install?
- Do you need a `.gemspec` file?
- What version of Ruby does your program need?
- What Rubygems does your program use?

Here's what your Gemfile might look like:
```ruby
source 'https://rubygems.org'      #where bundler will look for gems
Ruby '2.4.0'                       # the version of Ruby you need
gem 'minitest', '~> 5.10'          # gems your program uses
gem 'minitest-reporters', '~> 1.1' # gems your program uses
```

Though we didn't list some Gems in our `Gemfile`, the Gems each have their own `Gemfile`, which lists their dependencies and downloads them.

`Bundle install` creates a `Gemfile.lock` file that has all the dependency information for our app.

Last thing, we must `require bundler/setup` before any other `require` statements.
