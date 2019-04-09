# My Cucumber Suite Of Tests

This is a side project I made to test the BBC's Standard Media Player

The project is an automated test suite written in a BDD manner

This setup is for MacOS only. However some parts of the guide apply to Windows

Make a new folder and download the code from Github

```
mkdir new_folder
cd new_folder
git clone https://github.com/dalyw01/smp-tests
Cloning into 'new_folder'...
Username for 'https://github.com': dalyw01
Password for 'https://dalyw01@github.com':
```

## Installing programs

Install **Apple CLT** (Command Line Tools) from their website - https://developer.apple.com/download/more/

You may have to install the CLT through the MacOS App Store along with Xcode

Next install **Homebrew** to make installing applications easier - https://brew.sh/

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

Install **RVM** (Ruby Version Manager) to manage the version of Ruby you're using (You might to brew install gnupg beforehand)

```
\curl -sSL https://get.rvm.io | bash
```

Then to set it up run

```
source /Users/dalyw01/.rvm/scripts/rvm
```

Install the required version of Ruby which is currently 2.5.3

```
rvm install 2.5.3
```

Check the current version if the one you downloaded

```
rvm list
 * ruby-2.3.1 [ x86_64 ]
   ruby-2.4.1 [ x86_64 ]
=> ruby-2.5.3 [ x86_64 ]

# => - current
# =* - current && default
#  * - default
```

## Managing Ruby Gems

You can install each gem seperatley with "gem install X" from https://rubygems.org

Here are some of the other individual gems you can install

```
gem install cucumber
gem install capybara
gem install selenium-webdriver
gem install rspec
gem install touch_action
```

After you should install the bundler gem

```
gem install bundle
```

Bundler provides a consistent environment for Ruby projects by tracking and installing the exact gems and versions that are needed

Bundler may prompt you to download/modify any necessary gems

```
bundle install
```

When other devs run bundle install, bundler will find the Gemfile.lock and skip the dependency resolution step. 

Instead, it will install all of the same gems that you used on the original machine.

Your Gemfile.lock file may be empty and bundler will populate it with compatible gems

Your Gemfile.lock should look a little something like this

```
GEM
  remote: https://rubygems.org/
 specs:
    addressable (2.6.0)
      public_suffix (>= 2.0.2, < 4.0)
    capybara (3.15.0)
      addressable
      etc ...
      xpath (~> 3.2)
    childprocess (0.9.0)
      ffi (~> 1.0, >= 1.0.11)
    cucumber (3.1.2)
      etc ...

PLATFORMS
  ruby

DEPENDENCIES
  cucumber
  capybara
  rspec
  selenium-webdriver (= 3.141)
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
