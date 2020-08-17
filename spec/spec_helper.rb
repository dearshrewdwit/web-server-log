require 'simplecov'
SimpleCov.start

RSpec.configure do |config|
  config.filter_run_when_matching :focus
  config.warnings = true
  config.order = :random
  Kernel.srand config.seed
end
