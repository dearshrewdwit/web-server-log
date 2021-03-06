module Sorts
  class Base
    NAME = 'base'

    def initialize
      @counter = {}
    end

    def process(_page_visit)
      raise 'implement me in a subclass'
    end

    def summary
      raise 'implement me in a subclass'
    end

    def print_summary(presenter: SortPresenter)
      presenter.generate_from(self)
    end

    def name
      self.class::NAME
    end

    private

    attr_reader :counter
  end
end
