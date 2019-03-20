# My Cucumber Suite Of Tests

This is a little side project I made to test the BBC's SMP

Install Homebrew - https://brew.sh/

Install rbenv using Homebrew

```
brew install rbenv
```

Select the version of Ruby you want to install e.g 2.6.2

```
rbenv install 2.6.2
```

Check the Ruby Version is what you selected

```
Daly-Command-Centre:smp-tests dalyw01$ rbenv versions
  system
  2.4.1
* 2.6.2 (set by /Users/dalyw01/.rbenv/version)
```

Your Gemfile should look like 

```
source 'https://rubygems.org'

gem 'cucumber'
gem 'capybara'
gem 'rspec'
gem 'selenium-webdriver','3.141'
gem 'touch_action'
```

You can install each seperatley with "gem install X" from https://rubygems.org

If you run a "bundle install" it may edit the Gemfile.lock and add in some additional gems

You'll want to lock to certain version of each gem

Your Gemfile.lock should look something like this

```
GEM
  remote: https://rubygems.org/
  specs:
    cucumber (3.1.2)
    capybara (3.12.0)
    rspec (3.8.0)
    selenium-webdriver (3.141)
    touch_action (1.3.3)

PLATFORMS
  ruby

DEPENDENCIES
  cucumber
  capybara
  rspec
  selenium-webdriver
  touch_action

BUNDLED WITH
   2.0.1
```

Some basic commands and knowledge to run tests in this project

To run all feature files with Chrome

```
cucumber features/
```

To run through all feature files with Firefox

```
cucumber features/ BROWSER=firefox
```

To run through a particular scenario in a table with Firefox
```
cucumber features/core_functionality.feature:54 BROWSER=firefox
```

To run a particular test point in a feature file
```
cucumber features/cp_watch_more.feature -t @4
```

To run all tests except for anything tagged @ads
```
cucumber features/ --tags ~@ads BROWSER=chrome
```
