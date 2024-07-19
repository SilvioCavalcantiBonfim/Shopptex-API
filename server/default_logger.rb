require 'logger'

module HTTP
  module Log
    COLORS = {
      'ERROR' => "\033[0;31m",
      'INFO' => "\033[0;32m",
      'WARN' => "\033[0;33m",
      'FATAL' => "\033[0;35m",
      'DEBUG' => "\033[0;36m"
    }
    def self.create(level: 'INFO')
      logger = Logger.new($stdout)
      logger.formatter = proc do |severity, datetime, _progname, msg|
        "[#{datetime}][#{COLORS[severity]}#{severity}\033[0m]: #{msg}\n"
      end
      logger.level = level
      logger
    end
  end
end
