require 'log'

RSpec.describe Log do
  let(:file_path) { 'spec/support/fixtures/short-example.log' }
  let(:test_sort) { double(process: nil, print_summary: 'summary') }
  let(:parsed_line) { double('lp instance') }
  let(:lp_class) { double('lp class', new: parsed_line) }

  subject(:log) do
    described_class.new(file_path: file_path, line_parser_class: lp_class)
  end

  describe '#sort' do
    it 'creates a page visit' do
      expect(lp_class).to receive(:new)
      log.sort(sorts: [test_sort])
    end

    it 'asks sorts to process each line' do
      expect(test_sort).to receive(:process).with(parsed_line)
      log.sort(sorts: [test_sort])
    end

    it 'asks sorts to print summaries' do
      expect(test_sort).to receive(:print_summary)
      log.sort(sorts: [test_sort])
    end
  end
end
