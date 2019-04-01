# My Cucumber Suite Of Tests

This is a side project I made to test the BBC's SMP.

This setup is for MacOS only. However some parts of the guide apply to Windows.

Make a new folder and download the code from Github

```
mkdir new_folder
cd new_folder
git clone https://github.com/dalyw01/smp-tests
Cloning into 'new_folder'...
Username for 'https://github.com': dalyw01
Password for 'https://dalyw01@github.com':
```

If prompted, password is a key you generate from - https://github.com/settings/tokens

## Installing programs

Install Apple CLT "Command Line Tools" from Apple's site - https://developer.apple.com/download/more/

Install Homebrew to make installing applications easier - https://brew.sh/

I typically do it from this directory

```
Daly-Command-Centre:~ dalyw01$ pwd
/Users/dalyw01
Daly-Command-Centre:~ dalyw01$ ls
Applications  Documents Library   Music   Public
Desktop   Downloads Movies    Pictures
Daly-Command-Centre:~ dalyw01$
```

Install Selenium -

```
brew install selenium-server-standalone
brew tap homebrew/cask
```

Install Chromedriver for Google Chrome

```
brew cask install chromedriver
```

Install Geckodriver for Firefox

```
brew install geckodriver
```

Install the required version of Ruby

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

For example -

```
gem install bundler
```

<<<<<<< HEAD
If you install the bundler gem then you can run a "bundle install"
=======
Here are some others you can install

```
gem install cucumber -v 2.4.0
gem install capybara
gem install selenium-webdriver
gem install rspec
gem install touch_action
```

If you install the bundler gem then you can run a "bundle install"
>>>>>>> 0562e09de49a088b6ea1a9444f229222cf9a5f41

```
bundle install
```

Bundler may prompt you to download/modify any necessary gems

Your Gemfile.lock file may be empty and bundler will populate it with compatible gems

Your Gemfile.lock should look a little something like this -

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
  capybara
  cucumber
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
