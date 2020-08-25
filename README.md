# Webserver Logs

## Quick Start


1. `git clone` this repository and `cd` into it
2. `bundle install` the dependencies
3. run `bin/sort-logs webserver.log`

## Testing

1. Run `bundle exec rspec` to run the test suite
2. Run `bundle exec rubocop` to run the linter using this [set of rules](.rubocop.yml)
3. After a test run,`open coverage/index.html` to see full test coverage report.



## Approach

_This was fun! I spent about 4hours on it, noting down my approach and then documented my thoughts afterwards._
_edit: I spent another 30 mins improving things_

##### The Plan
The plan is to validate user input via the command line, read from the log file, parse each line, send the parsed line to a set of sorts that are requested: ordered total and ordered total unique. Then each sort prints its own summary. I'll try to keep it as simple as possible, while keeping it easy to read & easy to change.

##### Implementation Steps
1. Started with a set of feature tests to codify expected behaviour for command
- when called correctly
- when called with no args/too many args
- when the file doesn't exist/is not a log.

2. Implemented the command validation

3. Wrote the runnable script as the feature spec specified -> showed that next step is to implement the sort logic. I plan to subclass off a base sort class.

4. Wrote an integration test to cover the log actually working as intended.

5. Implemented the sorts with an injected presenter.

##### Reflections

This test-driven modular small app feels easy to read and easy to change and it follows principles of object oriented design. Here are improvements I'd continue to make or my thoughts about it.

1. Not currently a huge fan of how the presenter relies a lot on knowing specifically how a summary should look eg: 2d array format for the sort summary => I'd probably improve this next, and wrap the data in an object to pass around like PageVisit, eg: SummmaryLine. However, different presenters might need to implement their own approach, so there's not enough evidence yet to pull out an abstraction.

7. ~~Not a fan of the current file type validation => I'd improve this with a pattern match.~~ Implemented with `File.extname`

8. I might be tempted to specify shared behaviour for the sort tests with RSpec's shared examples.

9. There's currently no validation of the log file format - it assumes a validly formatted file. It's possible to use PageVisit to validate itself at some point. Use Log to store line parsing errors maybe and print a summary of the parsing. Not needed yet.

10. Can remove more duplication from sort classes, but no real need yet. The aggregation techniques are quite dependent on building sortable key-value pairs, but this implementation detail is separate from the sort interface, so can be easily changed if needed.

11. It's possible to inject an I/O object wrapped in a class at runtime, to separate output from format concerns - but not needed yet.

12. ~~the presenter test uses a custom mock to allow for the constant. I'd use a method wrapper and stub it next time.~~ Implemented.

13. At some point the input validation would need to change - along with the commands to follow a more conventional approach with multiple sort commands when needed: eg: options at runtime for specific sorts, top 5, different sort orders. Not needed yet.
