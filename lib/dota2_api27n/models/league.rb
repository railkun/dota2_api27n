module Dota2Api27n
  class League
    ENDPOINT = 'leagues'.freeze

    attr_reader :league_id, :name, :tier, :region, :url, :description, :start_timestamp,
                :end_timestamp, :status, :total_prize_pool, :is_live

    def initialize(attributes)
      @total_prize_pool = attributes['total_prize_pool']
      @start_timestamp  = attributes['start_timestamp']
      @end_timestamp    = attributes['end_timestamp']
      @description      = attributes['description']
      @league_id        = attributes['league_id']
      @is_live          = attributes['is_live']
      @region           = attributes['region']
      @status           = attributes['status']
      @name             = attributes['name']
      @tier             = attributes['tier']
      @url              = attributes['url']
    end
  end
end
