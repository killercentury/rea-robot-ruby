# rea-robot-ruby
[![Build Status](https://travis-ci.org/killercentury/rea-robot-ruby.svg?branch=master)](https://travis-ci.org/killercentury/rea-robot-ruby)
[![Test Coverage](https://codeclimate.com/github/killercentury/rea-robot-ruby/badges/coverage.svg)](https://codeclimate.com/github/killercentury/rea-robot-ruby)

### Run

#### Pre-installed Ruby Env
    bundle install
    ./bin/app.rb

#### Docker Env
Run the app with the Ruby Docker image:

    docker run -it --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp ruby:2.2 ruby bin/app.rb
    
(This Ruby Docker image should allow you to run this single script app directly, since the app has no dependecy on other gems now.)
    
Run the app from a pre-built Docker image:

    docker run -it --rm killercentury/rea-robot-ruby
    
(This pre-built Docker image should allow you to run rspec and cucumber without installing gems manually. Just specify the 'bundle exec rspec' or 'bundle exec cucumber' command at the end.)

#### Quit
Type 'quit' to leave the interactive command line immediately.

### Test

This app has been built by using TDD/BDD.

#### Test Data
Simple test data examples are provided in this text file [test-data.txt](https://github.com/killercentury/rea-robot-ruby/blob/master/test-data.txt). However, it is only for demo and quick check purpose. More comprehensive tests can be found and run as below.

#### Unit Tests
Unit tests are based on [Rspec](https://github.com/rspec/rspec). They are located in [spec/robot_spec.rb](https://github.com/killercentury/rea-robot-ruby/blob/master/spec/robot_spec.rb).

#### Acceptance Tests
Acceptance tests are based on [Cucumber](https://github.com/cucumber/cucumber) and [Aruba](https://github.com/cucumber/aruba) for CLI. These human readable accpetance tests are located in two separated feature files under the [features](https://github.com/killercentury/rea-robot-ruby/tree/master/features) folder.

#### Test Coverage
Test coverage can be seen on top of this document or on this [Code Climate repository](https://codeclimate.com/github/killercentury/rea-robot-ruby)

### Builds
The current build status can be seen on top of this document. And the builds history can be found on this [Travis CI repository](https://travis-ci.org/killercentury/rea-robot-ruby)

### To Do
Take an advantage of Reactive Extensions [Rx.rb](https://github.com/ReactiveX/Rx.rb) to handle asynchronous input streams.
