class PageVisit
  def initialize(line)
    @line = line
  end

  def path
    line.split[0]
  end

  def ip_address
    line.split[1]
  end

  private

  attr_reader :line
end
