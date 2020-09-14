module Dota2Api27n
  class LeaguesRequest

    def self.leagues(offset, limit)
      all_leagues(offset, limit).results
    end

    def self.total_leagues(offset, limit)
      all_leagues(offset, limit).total
    end

    private

    def self.all_leagues(offset, limit)
      options = "?offset=#{offset}&limit=#{limit}"

      leagues_request = request(League::ENDPOINT, options)

      if leagues_request.headers['x-ratelimit-remaining'].to_i < 0
        sleep leagues_request.headers['x-ratelimit-reset'].to_i
        leagues_request = request(League::ENDPOINT, options)
      else
        leagues_request
      end

      raise RequestEmpty if leagues_request['results'].empty?

      results = leagues_request['results'].map { |league| League.new(league) }
      total = leagues_request['meta']['total']

      Leagues.new(results, total)
    end

    def self.request(method, options = nil)
      client = Client.new.get(method, options)
    end
  end
end
