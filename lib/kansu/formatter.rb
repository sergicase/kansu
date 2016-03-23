require 'json'
class Formatter

  def format_log_to_json(log)
    json_log = {
        :message => log.message,
        :extra => log.extra,
        :level => log.level,
        :levelName => log.level_name,
        :method => log.method,
        :file => log.file
    }
    json_log.to_json
  end

end