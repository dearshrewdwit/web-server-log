require_relative 'base'

module Sorts
  class TotalVisits < Base
    NAME = "total visits"

    def initialize
      @counter = Hash.new(0)
    end

    def process(page_visit)
      counter[page_visit.path] += 1
    end

    def summary
      counter.sort_by { |path, count| count}.reverse
    end
  end
end
