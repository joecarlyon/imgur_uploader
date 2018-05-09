#!/usr/bin/env bash
BROWSER=chrome bundle exec rspec spec --format html --out rspec_results_chrome.html
BROWSER=firefox bundle exec rspec spec --format html --out rspec_results_firefox.html