require 'sorts/total_visits'
require 'sorts/unique_visits'
require 'log'

RSpec.describe Log do
  let(:file_path) { 'spec/support/example.log' }
  let(:test_sort) { double(process: nil, print_summary: 'summary')}
  let(:page_visit) { double('pv instance') }
  let(:page_visit_class) { double('pv class', new: page_visit) }
  subject(:log) { described_class.new(page_visit_class: page_visit_class) }

  describe '#sort' do
    it 'creates a page visit' do
      expect(page_visit_class).to receive(:new)
      log.sort(file_path: file_path, sorts: [test_sort])
    end

    it 'asks sorts to process each line' do
      expect(test_sort).to receive(:process).with(page_visit)
      log.sort(file_path: file_path, sorts: [test_sort])
    end

    it 'asks sorts to print summaries' do
      expect(test_sort).to receive(:print_summary)
      log.sort(file_path: file_path, sorts: [test_sort])
    end
  end
end
