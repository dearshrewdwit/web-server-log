require 'sorts/unique_visits'

RSpec.describe Sorts::UniqueVisits do
  let(:page_visit) { double(path: '/about', ip_address: '184.123.665.067') }
  let(:page_visit2) { double(path: '/about', ip_address: '184.123.665.067') }
  let(:page_visit3) { double(path: '/home', ip_address: '722.247.931.582') }
  let(:page_visit4) { double(path: '/home', ip_address: '184.123.665.067') }

  subject(:sort) { described_class.new }

  it 'can aggregate and order highest first unique page visits' do
    sort.process(page_visit)
    sort.process(page_visit2)
    sort.process(page_visit3)
    sort.process(page_visit4)

    expect(sort.summary).to eq [[page_visit3.path, 2], [page_visit.path, 1]]
  end

  it 'can aggregate the same page visit' do
    sort.process(page_visit)
    sort.process(page_visit2)
    expect(sort.summary).to eq [[page_visit.path, 1]]
  end
end
