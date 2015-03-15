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
    
Run the app from a pre-built image:

    docker run -it --rm killercentury/rea-robot-ruby
    
### Test

#### Unit Tests
Unit tests are based on [Rspec](https://github.com/rspec/rspec). They are located in [spec/robot_spec.rb](https://github.com/killercentury/rea-robot-ruby/blob/master/spec/robot_spec.rb).

#### Acceptance Tests
Acceptance tests are based on [Cucumber](https://github.com/cucumber/cucumber) and [Aruba](https://github.com/cucumber/aruba). These human readable accpetance tests are located in separated feature file under the [features](https://github.com/killercentury/rea-robot-ruby/tree/master/features) folder.

### Builds
The builds history can be seen on this [Travis CI repository](https://travis-ci.org/killercentury/rea-robot-ruby)