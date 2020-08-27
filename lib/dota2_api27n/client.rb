module Dota2Api27n
  class Client
    BASE_URL = 'https://dota-leagues.27n.gg/'

    def get(pathname, options)
      request = HTTParty.get("#{BASE_URL}#{pathname}#{options}")
      request.code != 200 ? (raise RequestError) : request
    end
  end
end
