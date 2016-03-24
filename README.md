# kansu
ELK gem  logger using Redis for save logs

### Requirements

You need redis gem for save the logs into it.

```sh
$ gem install redis
```

### Installation

```sh
$ gem install gem 'kansu', :git => 'git://github.com/sergicase/kansu.git'
```

> I'm waiting for publish the gem to https://rubygems.org

### Structure

Kansu.new(*Redis(Redis object),*your_list_on_redis(String),debug_mode(Boolean))

You need to use a Redis object or create a new one then a list for save the logs in your redis and if you 
want debug mode true/false

Kansu.debug("message"(String),"extra"(Array/String))

This log extends from Logger, so you have the same types from logger.

  - Uknown
  - Fatal
  - Error
  - Warn
  - Info
  - Debug

### How to (Samples)

**Ruby file**

```sh
$ kansu = Kansu.new(Redis.new,'mylog',false)
$ kansu.debug("Debug this",[:line => 182, :message => "Some error happen", :reason => "no reason"]
```

**Ruby on Rails**

Here I prefer an a Initializer when Rails start and then use as a global.

```sh
$ $kansu = Kansu.new(Redis.new,'myredislog',false)
$ $kansu.debug("Debug Rails",[:say => "Hello Rails", :respond => "Hi, Kansu"]
```
