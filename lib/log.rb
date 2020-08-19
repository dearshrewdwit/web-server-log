class Log
  SORT_CLASSES = [
    Sorts::TotalVisits,
    Sorts::UniqueVisits
  ]

  def initialize(page_visit_class: PageVisit)
    @page_visit_class = page_visit_class
  end

  def sort(file_path:, sorts: new_sorts)
    File.open(file_path, 'r') do |file|
      file.each_line do |line|
        page_visit = page_visit_class.new(line.chomp)

        sorts.each do |sort|
          sort.process(page_visit)
        end
      end
    end

    sorts.each(&:print_summary)
  end

  private

  attr_reader :page_visit_class

  def new_sorts
    SORT_CLASSES.map(&:new)
  end
end
