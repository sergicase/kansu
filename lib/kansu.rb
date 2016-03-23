require 'kansu/persistor'
require 'kansu/kansu_logger'
require 'kansu/formatter'
class Kansu
  attr_reader :persist,:formatter,:debug_mode


  def initialize(redis,list_name,debug_mode=true)
    begin
      @persist =  Persistor.new(redis,list_name)
      @formatter = Formatter.new
      @debug_mode = debug_mode
    rescue Exception => e
      puts e.message
    end
  end

  def unknown(message,data)
    kansu_logger =  KansuLogger.new(__method__,message,data)
    save(kansu_logger)
  end

  def fatal(message,data)
    kansu_logger =  KansuLogger.new(__method__,message,data)
    save(kansu_logger)
  end

  def error(message,data)
    kansu_logger =  KansuLogger.new(__method__,message,data)
    save(kansu_logger)
  end

  def warn(message,data)
    kansu_logger =  KansuLogger.new(__method__,message,data)
    save(kansu_logger)
  end

  def info(message,data)
    kansu_logger =  KansuLogger.new(__method__,message,data)
    save(kansu_logger)
  end

  def debug(message,data)
    kansu_logger =  KansuLogger.new(__method__,message,data)
    if @debug_mode
      save(kansu_logger)
    end
  end


  private
  def save(log)
    if log.is_a?(KansuLogger)
      @persist.save(format_log(log))
    end

  end

  def format_log(log)
    @formatter.format_log_to_json(log)
  end


end