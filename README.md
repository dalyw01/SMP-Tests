# SMP Tests

This is a Cucumber project made to test the BBC's Standard Media Player

The project is an automated test suite written in a BDD manner

This setup is for MacOS only 

## Getting Started

Make a new folder and download the code from Github

```
mkdir new_folder
cd new_folder
git clone https://github.com/dalyw01/smp-ui-tests
Cloning into 'new_folder'...
Username for 'https://github.com': dalyw01
Password for 'https://dalyw01@github.com':
```

## Installing Programs

Install **Apple CLT** (Command Line Tools) from their website - https://developer.apple.com/download/more/

You may have to install the CLT through the MacOS App Store along with Xcode

Next install **Homebrew** to make installing other programs easier - https://brew.sh/

Install Homebrew and run initial commands from this directory

```
pwd
/Users/Username
ls
Applications  Documents Library   Music   Public
Desktop   Downloads Movies    Pictures
```

Install **Selenium** using Homebrew

```
brew install selenium-server-standalone
```

Install **Chromedriver** for Google Chrome using Homebrew

```
brew cask install chromedriver
```

Install **Geckodriver** for Firefox using Homebrew

```
brew install geckodriver
```

Install **RVM** (Ruby Version Manager) to manage Ruby versions (You might need to brew install gnupg beforehand)

```
\curl -sSL https://get.rvm.io | bash
```

Then to set RVM up run

```
source /Users/dalyw01/.rvm/scripts/rvm
```

Install the required version of Ruby which is currently 2.5.3

```
rvm install 2.5.3
```

Check the current version being used is the one you downloaded

```
rvm list
 * ruby-2.3.1 [ x86_64 ]
   ruby-2.4.1 [ x86_64 ]
=> ruby-2.5.3 [ x86_64 ]

# => - current
# =* - current && default
#  * - default
```

## Configuring Ruby Gems

The Gemfile file contains a list of all gems we need included for this project

Look at Gemfile in Cucumber to see what's needed, it should look something like this

```
source 'https://rubygems.org'

gem 'cucumber'
gem 'capybara'
gem 'rspec'
gem 'selenium-webdriver'
gem 'touch_action'
```

You then install each gem seperatley with "gem install X" from https://rubygems.org

Here is how you can install each individual gem

```
gem install cucumber
gem install capybara
gem install rspec
gem install selenium-webdriver
gem install touch_action
```

Lets install the bundler gem

```
gem install bundler
```

Let's then run a bundle install

```
bundle install
```

Running bundle install will look at the **Gemfile.lock** and install the exact same versions of every gem, rather than just looking at **Gemfile** and installing the most recent versions

If Gemfile.lock IS NOT present then Bundler will generate it when we run a script with a list of compatible gems

Once installed, this is an example of how it will look:

```
GEM
  remote: https://rubygems.org/
  specs:
    addressable (2.7.0)
      public_suffix (>= 2.0.2, < 5.0)
    backports (3.15.0)
    browserstack-automate (0.1.0)
      browserstack-local (~> 1.2)
      curb (~> 0)
      selenium-webdriver
    browserstack-local (1.3.0)
    builder (3.2.3)
    capybara (3.29.0)
      addressable
      mini_mime (>= 0.1.3)
      nokogiri (~> 1.8)
      rack (>= 1.6.0)
      rack-test (>= 0.6.3)
      regexp_parser (~> 1.5)
      xpath (~> 3.2)
    childprocess (2.0.0)
      rake (< 13.0)
    chunky_png (1.3.11)
    cucumber (3.1.2)
      builder (>= 2.1.2)
      cucumber-core (~> 3.2.0)
      cucumber-expressions (~> 6.0.1)
      cucumber-wire (~> 0.0.1)
      diff-lcs (~> 1.3)
      gherkin (~> 5.1.0)
      multi_json (>= 1.7.5, < 2.0)
      multi_test (>= 0.1.2)
    cucumber-core (3.2.1)
      backports (>= 3.8.0)
      cucumber-tag_expressions (~> 1.1.0)
      gherkin (~> 5.0)
    cucumber-expressions (6.0.1)
    cucumber-tag_expressions (1.1.1)
    cucumber-wire (0.0.1)
    curb (0.9.10)
    diff-lcs (1.3)
    gherkin (5.1.0)
    image_size (2.0.2)
    mini_mime (1.0.2)
    mini_portile2 (2.4.0)
    multi_json (1.13.1)
    multi_test (0.1.2)
    nokogiri (1.10.4)
      mini_portile2 (~> 2.4.0)
    public_suffix (4.0.1)
    rack (2.0.7)
    rack-test (1.1.0)
      rack (>= 1.0, < 3)
    rake (12.3.3)
    regexp_parser (1.6.0)
    rspec (3.8.0)
      rspec-core (~> 3.8.0)
      rspec-expectations (~> 3.8.0)
      rspec-mocks (~> 3.8.0)
    rspec-core (3.8.2)
      rspec-support (~> 3.8.0)
    rspec-expectations (3.8.4)
      diff-lcs (>= 1.2.0, < 2.0)
      rspec-support (~> 3.8.0)
    rspec-mocks (3.8.1)
      diff-lcs (>= 1.2.0, < 2.0)
      rspec-support (~> 3.8.0)
    rspec-support (3.8.2)
    rubyzip (1.3.0)
    selenium-webdriver (3.142.4)
      childprocess (>= 0.5, < 3.0)
      rubyzip (~> 1.2, >= 1.2.2)
    touch_action (1.3.3)
    xpath (3.2.0)
      nokogiri (~> 1.8)

PLATFORMS
  ruby

DEPENDENCIES
  browserstack-automate
  capybara
  chunky_png
  cucumber
  image_size
  rspec
  selenium-webdriver
  touch_action

BUNDLED WITH
   2.0.1

```

## Running Tests

Some basic commands and knowledge to run tests in this project

To run a single script

```
cucumber features/core_features/core_functionality.feature
```

To run a single test from a single script

```
cucumber features/core_features/core_functionality.feature:37
```

To run all scripts

```
cucumber features/
```

To run all feature files of a particular folder with Chrome

```
cucumber features/core_features/ BROWSER=chrome
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
