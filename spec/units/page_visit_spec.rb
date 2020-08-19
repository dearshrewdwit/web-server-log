require 'page_visit'

RSpec.describe PageVisit do

  let(:line) { '/help_page/1 126.318.035.038' }
  subject(:page_visit) { described_class.new(line) }

  it 'returns the path' do
    expect(page_visit.path).to eq '/help_page/1'
  end

  it 'returns the ip address' do
    expect(page_visit.ip_address).to eq '126.318.035.038'
  end
end
