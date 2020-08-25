class Log
  SORT_CLASSES = [
    Sorts::TotalVisits,
    Sorts::UniqueVisits
  ]

  def initialize(file_path:, line_parser_class: PageVisit)
    @file_path = file_path
    @line_parser_class = line_parser_class
  end

  def sort(sorts: new_sorts)
    File.open(file_path, 'r') do |file|
      file.each_line do |line|
        parsed_line = line_parser_class.new(line.chomp)

        sorts.each do |sort|
          sort.process(parsed_line)
        end
      end
    end

    sorts.each(&:print_summary)
  end

  private

  attr_reader :line_parser_class, :file_path

  def new_sorts
    SORT_CLASSES.map(&:new)
  end
end
