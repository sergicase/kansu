class Persistor

  attr_reader :redis,:list

  def initialize(database,list)
    if database.is_a?(Redis) and list != nil
      @redis = database
      @list = list
    else
      raise Exception("Database not recognized")
    end
  end

  def save(log)
    @redis.lpush(@list,log)
  end
end