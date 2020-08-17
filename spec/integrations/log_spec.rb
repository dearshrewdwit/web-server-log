require 'sorts/total_visits'
require 'sorts/unique_visits'
require 'sort_presenter'
require 'page_visit'
require 'log'

RSpec.describe "Log Integration" do
  let(:expected) do
    "Total visits\n"\
    "	/help_page/1 3 total visits\n"\
    "	/about 1 total visits\n"\
    "	/index 1 total visits\n"\
    "	/about/2 1 total visits\n"\
    "	/home 1 total visits\n"\
    "	/contact 1 total visits\n"\
    "Unique visits\n"\
    "	/help_page/1 3 unique visits\n"\
    "	/about 1 unique visits\n"\
    "	/index 1 unique visits\n"\
    "	/about/2 1 unique visits\n"\
    "	/home 1 unique visits\n"\
    "	/contact 1 unique visits\n"
  end
  let(:file_path) { 'spec/support/example.log' }
  subject(:log) { Log.new }

  describe '#sort' do
    it 'outputs correctly' do
      expect { log.sort(file_path: file_path) }.to output(expected).to_stdout
    end
  end
end