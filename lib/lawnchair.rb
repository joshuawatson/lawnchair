require 'rubygems'
require 'redis'
require 'storage_engine/abstract'
require 'storage_engine/redis'
require 'storage_engine/in_process'
require 'storage_engine/composite'
require 'activesupport'

if defined? RAILS_ENV
  require 'marshal_extension' if RAILS_ENV =~ /development/
  require 'view/helper'
end

module Lawnchair
  class << self
    attr_reader :redis
    
    def cache(key, options={}, &block)
      if options[:in_process]
        store = Lawnchair::StorageEngine::Composite.new(:in_process, :redis)
      else
        store = Lawnchair::StorageEngine::Redis
      end
      store.fetch(key, options, &block)
    end

    def connectdb(redis=nil)
      @redis = (redis || Redis.new(:db => 11))
      Lawnchair::StorageEngine::Redis.verify_db_connection
    end

    def flushdb
      redis.flushdb
    end
  end
  
  class Cache
    # <b>DEPRECATED:</b> Please use <tt>Lawnchair.cache</tt> instead.
    def self.me(key, options={}, &block)
      warn "[DEPRECATION] 'Lawnchair::Cache.me' is deprecated.  Please use 'Lawnchair.cache' instead."
      Lawnchair.cache(key, options, &block)
    end
  end
end

class Object
  def self.lawnchair_cache(method)
    self.class_eval %{
      def #{method}_with_lawnchair
        key = "#\{self.class.name\}:#{method}:#\{self.id\}"
        Lawnchair.cache(key, {}) do
          self.#{method}_without_lawnchair
        end
      end
    }

    # should do something interesting
    alias_method_chain method, :lawnchair
  end
end

