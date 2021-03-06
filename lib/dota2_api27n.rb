require 'httparty'

require_relative 'dota2_api27n/client'
require_relative 'dota2_api27n/models/league'
require_relative 'dota2_api27n/models/leagues'
require_relative 'dota2_api27n/leagues_request'
require_relative 'dota2_api27n/exceptions/request_error'
require_relative 'dota2_api27n/exceptions/request_empty'

module Dota2Api27n
  def self.leagues(offset: 0, limit: 100)
    LeaguesRequest.leagues(offset, limit)
  end

  def self.total_leagues(offset: 0, limit: 100)
    LeaguesRequest.total_leagues(offset, limit)
  end
end
