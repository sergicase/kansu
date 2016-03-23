Gem::Specification.new do |gem|
  gem.name        = 'kansu'
  gem.version     = '0.0.1'
  gem.date        = '2016-03-23'
  gem.summary     = "Logger ELK!"
  gem.description = "Gem for log into redis that logstash can read "
  gem.authors     = ["Sergi Case"]
  gem.email       = 'sergi41@icloud.to'
  gem.files       = ["lib/kansu.rb","lib/kansu/persistor.rb","lib/kansu/kansu_logger.rb","lib/kansu/formatter.rb"]
  gem.homepage    =
      'http://rubygems.org/gems/kansu'
  gem.license       = 'MIT'
  gem.add_runtime_dependency "json",
                           ["= 1.8.3"]
end