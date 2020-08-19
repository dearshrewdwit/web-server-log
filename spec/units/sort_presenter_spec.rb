require 'sort_presenter'

class SortMock
  NAME = 'sort mock'

  def summary
    [['test', 1], ['test2', 0]]
  end
end

RSpec.describe SortPresenter do

  subject(:sort_presenter) { described_class }
  let(:expected) do
    "Sort mock\n"\
    "\ttest 1 sort mock\n"\
    "\ttest2 0 sort mock\n"
  end

  it 'generates a sort summary' do
    sort_mock = SortMock.new
    expect { sort_presenter.generate_from(sort_mock) }.to output(expected).to_stdout
  end
end
