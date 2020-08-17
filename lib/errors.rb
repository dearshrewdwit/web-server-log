class WebServerLogError < StandardError; end

class NoArgsError < WebServerLogError
end

class TooManyArgsError < WebServerLogError
end

class FileNotFoundError < WebServerLogError
end

class IncorrectFileTypeError < WebServerLogError
end
