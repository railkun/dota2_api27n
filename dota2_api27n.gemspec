Gem::Specification.new do |s|
  s.name          = 'dota2_api27n'
  s.version       = '1.0.5'
  s.date          = '2020-08-25'
  s.summary       = 'Dota2_Api27n - Simple gem for parse dota leagues'
  s.author        = 'Oleksii Protsenko'
  s.homepage      = 'https://github.com/railkun/dota2_api27n'
  s.license       = 'MIT'
  s.files         = [ 'lib/dota2_api27n.rb',
                      'lib/dota2_api27n/client.rb',
                      'lib/dota2_api27n/leagues.rb',
                      'lib/dota2_api27n/models/league.rb',
                      'lib/dota2_api27n/exceptions/request_error.rb',
                      'lib/dota2_api27n/exceptions/request_empty.rb'
                    ]
end
