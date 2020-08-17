require 'sorts/base'
require 'sort_presenter'

RSpec.describe Sorts::Base do
  let(:presenter_class) { double(generate_from: 'a summary') }
  subject(:base) { described_class.new }

  context 'must be implemented in subclass' do
    it 'can process a page' do
      expect { base.process('test') }.to raise_error('implement me in a subclass')
    end

    it 'can produce a summary' do
      expect { base.summary }.to raise_error('implement me in a subclass')
    end
  end

  it 'uses a presenter to print a summary' do
    expect(base.print_summary(presenter: presenter_class)).to eq 'a summary'
  end
end
