# Imgur Code Challenge
This is a set of automated tests using Ruby / Rspec to test workflows on imgur.com.

## Test Scenarios

• New Post: Uploads an image and verifies that it takes you to that page after

• Search: Results returned are tied to your query

• “Random Mode” function: Random button takes you to a new page without errors`

## Test Choices

I chose to take the happy path for reach of these tests. That's what Selenium is for. If I worked at Imgur, I would be
hitting API endpoints and verifying the results coming back. I imagine they have an "upload media" type of microservice,
and that probably has its own unit tests, integration tests, contract tests, and we'd use then use a live service test
and a Selenium test to make sure nothing on the front-end is preventing something from being uploaded.

None of the tests failed expectations, but I did need to use JavaScript to alter the DOM (eww). Sometimes, the page will
hang after the test has finished execution. That's because of the Firefox alert window. That's fixed by setting a
property in the Firefox profile. I didn't experience it with Chrome, but that's fixed in a similar manner.
I didn't add that because I wanted to timebox this effort.

This is currently set up to run in a single-threaded, serial manner. This is fine for a code challenge, but it doesn't
scale nicely. Of course, with some more love `driver` wouldn't be a global variable, `parallel_tests` would be used.

Prior to this, I haven't used Ruby in over 2 years. So this was an exercise on a few levels for me. Two files will be 
generated after tests run: `rspec_results_chrome` and `rspec_results_firefox`. I didn't include them in the repo.

Thanks for taking a look at this, and I welcome your feedback.

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