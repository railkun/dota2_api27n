require 'httparty'
require 'pry'

require_relative 'dota2_api27n/models/league'
require_relative 'dota2_api27n/client'
require_relative 'dota2_api27n/leagues'
require_relative 'dota2_api27n/exceptions/request_error'
require_relative 'dota2_api27n/exceptions/request_empty'

module Dota2Api27n
  def self.leagues(offset: 0, limit: 100)
    leagues ||= Leagues.new(offset, limit).leagues
  end

  def self.total_leagues(offset: 0, limit: 100)
    total_leagues ||= Leagues.new(offset, limit).total_leagues
  end
end
