class SortPresenter
  def self.generate_from(sort)
    name = sort.class::NAME

    puts name.capitalize
    sort.summary.each do |result|
      puts "\t#{result[0]} #{result[1]} #{name}"
    end
  end
end
