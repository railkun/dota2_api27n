module Dota2Api27n
  class Leagues
    attr_reader :leagues, :total_leagues

    def self.leagues(offset, limit)
      all_leagues(offset, limit)[:results]
    end

    def self.total_leagues(offset, limit)
      all_leagues(offset, limit)[:total_leagues]
    end

    private

    def self.all_leagues(offset, limit)
      options = "?offset=#{offset}&limit=#{limit}"

      leagues = request(League::ENDPOINT, options)

      if leagues.headers['x-ratelimit-remaining'].to_i < 0
        sleep leagues.headers['x-ratelimit-reset'].to_i
        leagues = request(League::ENDPOINT, options)
      else
        leagues
      end

      raise RequestEmpty if leagues['results'].empty?

      results = leagues['results'].map { |league| League.new(league) }
      total_leagues = leagues['meta']['total']

      {results: results, total_leagues: total_leagues}
    end

    def self.request(method, options = nil)
      client = Client.new.get(method, options)
    end
  end
end
