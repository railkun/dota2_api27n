require 'httparty'
require 'pry'

require_relative 'dota2_api27n/models/league'
require_relative 'dota2_api27n/client'
require_relative 'dota2_api27n/exceptions/request_error'
require_relative 'dota2_api27n/exceptions/request_empty'

module Dota2Api27n

  def self.leagues(offset: 0, limit: 100)
    options = "?offset=#{offset}&limit=#{limit}"

    leagues = request(League::ENDPOINT, options)

    if leagues.headers['x-ratelimit-remaining'].to_i < 0
      sleep leagues.headers['x-ratelimit-reset'].to_i
      leagues = request(League::ENDPOINT, options)
      leagues = leagues['results']
    else
      leagues = leagues['results']
    end

    raise RequestEmpty if leagues.empty?

    leagues.map { |league| League.new(league) }
  end

  def self.total_leagues
    total_leagues = request(League::ENDPOINT)
    total_leagues['meta']['total']
  end

  private

  def self.request(method, options = nil)
    Client.new.get(method, options)
  end
end
