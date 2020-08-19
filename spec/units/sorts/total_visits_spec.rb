require 'sorts/total_visits'

RSpec.describe Sorts::TotalVisits do
  let(:page_visit) { double(path: '/about') }
  let(:page_visit2) { double(path: '/home') }

  subject(:sort) { described_class.new }

  it 'can aggregate the same page' do
    2.times { sort.process(page_visit) }
    expect(sort.summary).to eq [[page_visit.path, 2]]
  end

  it 'can order highest first aggregated different pages' do
    sort.process(page_visit)
    2.times { sort.process(page_visit2) }
    expect(sort.summary).to eq [[page_visit2.path, 2], [page_visit.path, 1]]
  end
end
