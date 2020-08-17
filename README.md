# Webserver Logs

## Quick Start

1. `git clone` this repository and `cd` into it
2. `bundle install` the dependencies
3. run `bin/sort-logs webserver.log
```

## Testing

Run `bundle exec rspec` to run the test suite

Rub `rubocop` to run the linter

## Approach

The plan is to validate user input via the command line, read from the log file, passing each line to the set of sorts that are requested: ordered total and ordered total unique, then each sort then prints its own summary. I'll try to keep it as simple as possible, while keeping it easy to read & easy to change.

1. Started with a set of feature tests to codify expected behaviour
- when called correctly
- when called with no args/too many args
- when the file doesn't exist/is not a log.

2.
