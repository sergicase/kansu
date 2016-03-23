require 'logger'
require 'json'

class KansuLogger

  attr_reader :level,:file,:method,:level_name,:extra,:message

  def initialize(type,message,data)
    @level = get_level(type)
    @level_name = type.upcase
    @file = get_file
    @method = get_method
    @extra = data.to_json
    @message = message
  end


  private
  def get_level(type)
    Logger::const_get(type.upcase)
  end

  def get_file
    path = caller_locations(4,1)[0].path
    end_pos = path.index('.rb') + 3
    start_pos = path.rindex('/') + 1
    path[start_pos..end_pos]
  end

  def get_method
    caller_locations(4,1)[0].label
  end

end

