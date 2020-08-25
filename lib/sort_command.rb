class SortCommand
  ACCEPTED_FILE_TYPES = %w(.log)
  attr_reader :file_path

  def initialize(file_path = nil, *args)
    @file_path = file_path
    @args = args
  end

  def validate!
    validate_args
    validate_file_path
  end

  private

  attr_reader :args

  def validate_args
    raise NoArgsError if file_path.nil?
    raise TooManyArgsError unless args.empty?
  end

  def validate_file_path
    raise FileNotFoundError unless File.exist?(file_path)
    raise IncorrectFileTypeError unless accepted_file_type?
  end

  def accepted_file_type?
    ACCEPTED_FILE_TYPES.include?(file_path[-4..-1])
  end
end
