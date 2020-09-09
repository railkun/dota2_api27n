module Dota2Api27n
  class Leagues
    attr_reader :leagues, :total_leagues

    def initialize(offset, limit)
      leagues_request = leagues_request(offset, limit)

      @leagues = leagues_request[:results]
      @total_leagues = leagues_request[:total_leagues]
    end

    private

    def leagues_request(offset, limit)
      options = "?offset=#{offset}&limit=#{limit}"

      leagues = request(League::ENDPOINT, options)

      if leagues.headers['x-ratelimit-remaining'].to_i < 0
        sleep leagues.headers['x-ratelimit-reset'].to_i
        leagues = request(League::ENDPOINT, options)
      else
        leagues
      end

      raise RequestEmpty if leagues.empty?

      results = leagues['results'].map { |league| League.new(league) }
      total_leagues = leagues['meta']['total']

      {results: results, total_leagues: total_leagues}
    end

    def request(method, options = nil)
      client = Client.new.get(method, options)
    end
  end
end
