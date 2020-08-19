# Webserver Logs

## Quick Start


1. `git clone` this repository and `cd` into it
2. `bundle install` the dependencies
3. run `bin/sort-logs webserver.log`

## Testing

Run `bundle exec rspec` to run the test suite

Run `rubocop` to run the linter

After a test run,`open coverage/index.html` to see full test coverage report.

## Approach

The plan is to validate user input via the command line, read from the log file, passing each line to the set of sorts that are requested: ordered total and ordered total unique, then each sort then prints its own summary. I'll try to keep it as simple as possible, while keeping it easy to read & easy to change.

1. Started with a set of feature tests to codify expected behaviour for command
- when called correctly
- when called with no args/too many args
- when the file doesn't exist/is not a log.

2. Implemented the command validation

3. Wrote the runnable script as the feature spec specified -> showed that next step is to implement the sort logic. I plan to subclass off a base sort class.

4. Wrote an integration test to cover the log actually working as intended.

5. Implemented the sorts with an injected presenter.

6. Not currently a huge fan of how the presenter relies a lot on knowing specifically how a summary should look eg: 2d array format for the sort summary => I'd probably improve this next, and wrap the data in an object to pass around like PageVisit, eg: SummmaryLine.

7. Not a fan of the current file type validation => I'd improve this with a pattern match.

8. I might be tempted to DRY out the sort tests with RSpec's shared examples.

9. There's currently no validation of the log file format - it assumes a validly formatted file. It's possible to use PageVisit to validate itself at some point.

10. I might extract the summary outputs as fixtures to load them from there in the specs to help dry the tests out.
