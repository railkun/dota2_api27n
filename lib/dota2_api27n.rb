require 'httparty'
require 'pry'

require_relative 'dota2_api27n/models/league'
require_relative 'dota2_api27n/client'

module Dota2Api27n

  def self.leagues
    leagues = request(League::ENDPOINT, League::OPTIONS)

    if leagues.headers['x-ratelimit-remaining'].to_i < 0
      sleep leagues.headers['x-ratelimit-reset'].to_i
      leagues = request(League::ENDPOINT, League::OPTIONS)
      leagues = leagues['results']
    else
      leagues = leagues['results']
    end

    leagues.map { |league| League.new(league) }
  end

  private

  def self.request(method, options = nil)
    Client.new.get(method, options)
  end
end
