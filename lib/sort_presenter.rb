class SortPresenter
  def self.generate_from(sort)
    puts sort.name.capitalize
    sort.summary.each do |result|
      puts "\t#{result[0]} #{result[1]} #{sort.name}"
    end
  end
end
