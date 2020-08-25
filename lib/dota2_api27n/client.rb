module Dota2Api27n
  class Client
    BASE_URL = 'https://dota-leagues.27n.gg/'

    def get(pathname, options)
      HTTParty.get("#{BASE_URL}#{pathname}#{options}")
    end
  end
end
