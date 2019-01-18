# My Cucumber Suite Of Tests

This is a little side project I made to test the BBC's SMP

The Ruby Version to use

```
mc-s097941:smp-tests dalyw01$ ruby -v
ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-darwin18]
```

You'll need some gems for this, your Gemfile.lock should look like

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

You can install each seperatley with "gem install X" from https://rubygems.org

If you run a "bundle install" it may edit the Gemfile.lock and add in some additional gems

Your Gemfile should look like 

```
source 'https://rubygems.org'

gem 'cucumber'
gem 'capybara'
gem 'rspec'
gem 'selenium-webdriver','3.141'
gem 'touch_action'
```

Some basic commands and knowledge to familiarise with this project

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
