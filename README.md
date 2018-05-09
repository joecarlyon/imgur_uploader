# Imgur Code Challenge
This is a set of automated tests using Ruby / Rspec to test workflows on imgur.com.

## Test Scenarios

• New Post: Uploads an image and verifies that it takes you to that page after

• Search: Results returned are tied to your query

• “Random Mode” function: Random button takes you to a new page without errors`

## Test Cases / Results



## Installation

* You must have [Firefox](https://www.mozilla.org/en-US/firefox/) and [Chrome](https://www.google.com/chrome/) installed
* You must have [Ruby](http://rubyinstaller.org/downloads/) installed
> ```ruby --version```

* Bundler must be installed
> ```gem install bundler```

* Gems must be installed
> ```bundle install``` will take care of all necessary gems

* Install the drivers
> `brew install chromedriver`

> `brew install geckodriver`
   
* Run 
> ```./run_all_tests.sh```