require ('pry-byebug')
require_relative('models/space_cowboys')

space_cowboy1=SpaceCowboys.new({
  'name'=>'Blaggart The Rude',
  'species'=>'Earthling',
  'bounty_value'=>50000,
  'danger_level'=>'high'
  })

space_cowboy1.save()