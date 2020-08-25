require 'sort_presenter'

RSpec.describe SortPresenter do
  let(:sort_mock) do
    double(name: 'sort mock', summary: [['test', 1], ['test2', 0]])
  end
  let(:expected) do
    "Sort mock\n"\
    "\ttest 1 sort mock\n"\
    "\ttest2 0 sort mock\n"
  end
  subject(:sort_presenter) { described_class }

  it 'generates a sort summary' do
    expect { sort_presenter.generate_from(sort_mock) }.to output(expected).to_stdout
  end
end
