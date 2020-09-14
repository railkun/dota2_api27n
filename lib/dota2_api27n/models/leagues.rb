module Dota2Api27n
  class Leagues
    attr_reader :results, :total

    def initialize(results, total)
      @results = results
      @total   = total
    end
  end
end
