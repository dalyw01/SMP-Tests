# SMP Tests

This is a Cucumber project I made to test the BBC's Standard Media Player

The project is an automated test suite written in a BDD manner

This setup is for MacOS only. However some parts of the guide apply to Windows

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

I typically install Homebrew and run initial commands from this directory

```
pwd
/Users/dalyw01
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

You can install each gem seperatley with "gem install X" from https://rubygems.org

Here is how you can install each individual gem

```
gem install cucumber
gem install capybara
gem install rspec
gem install selenium-webdriver
gem install touch_action
```

If a file called Gemfile.lock is present we can use the Bundler gem

Lets install the bundler gem

```
gem install bundler
```

If Gemfile.lock IS present then run a bundle install

```
bundle install
```

Running bundle install will look at the **Gemfile.lock** and install the exact same versions of every gem, rather than just looking at **Gemfile** and installing the most recent versions

If Gemfile.lock IS NOT present then Bundler will generate it when we run a script with a list of compatible gems

```
GEM
  remote: https://rubygems.org/xww
  specs:
    addressable (2.6.0)
      public_suffix (>= 2.0.2, < 4.0)
    backports (3.13.0)
    builder (3.2.3)
    capybara (3.16.1)
      addressable
      mini_mime (>= 0.1.3)
      nokogiri (~> 1.8)
      rack (>= 1.6.0)
      rack-test (>= 0.6.3)
      regexp_parser (~> 1.2)
      xpath (~> 3.2)
    childprocess (0.9.0)
      ffi (~> 1.0, >= 1.0.11)
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
    diff-lcs (1.3)
    ffi (1.10.0)
    gherkin (5.1.0)
    mini_mime (1.0.1)
    mini_portile2 (2.4.0)
    multi_json (1.13.1)
    multi_test (0.1.2)
    nokogiri (1.10.2)
      mini_portile2 (~> 2.4.0)
    public_suffix (3.0.3)
    rack (2.0.7)
    rack-test (1.1.0)
      rack (>= 1.0, < 3)
    regexp_parser (1.4.0)
    rspec (3.8.0)
      rspec-core (~> 3.8.0)
      rspec-expectations (~> 3.8.0)
      rspec-mocks (~> 3.8.0)
    rspec-core (3.8.0)
      rspec-support (~> 3.8.0)
    rspec-expectations (3.8.2)
      diff-lcs (>= 1.2.0, < 2.0)
      rspec-support (~> 3.8.0)
    rspec-mocks (3.8.0)
      diff-lcs (>= 1.2.0, < 2.0)
      rspec-support (~> 3.8.0)
    rspec-support (3.8.0)
    rubyzip (1.2.2)
    selenium-webdriver (3.141.0)
      childprocess (~> 0.5)
      rubyzip (~> 1.2, >= 1.2.2)
    touch_action (1.3.3)
    xpath (3.2.0)
      nokogiri (~> 1.8)

PLATFORMS
  ruby

DEPENDENCIES
  capybara
  cucumber
  rspec
  selenium-webdriver
  touch_action

BUNDLED WITH
   2.0.1
```

## Running Tests

Some basic commands and knowledge to run tests in this project

To run all feature files with Chrome

```
cucumber features/
```

To run all feature files of a particular folder with Chrome

```
cucumber features/core_features/
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

## Additional Information

If you've got all of the above running successfully then congratulations!

You don't ***need*** to read any further!

However, from now on, when doing a PULL REQUEST proof functionality hasn't been broken in the process may be required

One for Mozilla Firefox and the other for Google Chrome

To create these files print the output to a html file

Some examples

```
cucumber features/core_features/ --format html > report_chrome.html BROWSER=chrome
cucumber features/additional_features/ --format html > report_firefox.html BROWSER=firefox
```

Once the html files have been generated please leave other devs know when doing a PULL request


