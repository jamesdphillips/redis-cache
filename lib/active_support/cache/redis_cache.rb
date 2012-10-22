require 'redis'
require 'active_support/cache'

module ActiveSupport
  module Cache
    class RedisCache < Store

      def initialize params
        @client = Redis.new params
      end

      protected

      def write_entry key, entry, opts = {}
        @client.send :set, key, entry
      rescue Errno::ECONNREFUSED => e
        false
      end

      def read_entry key, opts = {}
        @client.send :get, key
        entry.is_a?(ActiveSupport::Cache::Entry) ? entry : ActiveSupport::Cache::Entry.new(entry) if entry
      rescue Errno::ECONNREFUSED => e
        nil
      end

      def destroy_entry key, opts = {}
        @client.send :del, key
      rescue Errno::ECONNREFUSED => e
        nil
      end
    end 
  end
end