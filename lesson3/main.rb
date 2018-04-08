require_relative 'route'
require_relative 'station'
require_relative 'train'

st1 = Station.new('UFA')
puts 'Created new station UFA'

st2 = Station.new('MSK')
puts 'Created new station MSK'


kazan = Station.new('KZN')
puts 'Created new station KZN'

route_ufs_msk = Route.new(st1, st2)
route_ufs_msk.add_station(kazan)
route_ufs_msk.show_stations

p route_ufs_msk
