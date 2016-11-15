require ('pry-byebug')
require_relative('models/space_cowboy')

SpaceCowboy.delete_all

space_cowboy1=SpaceCowboy.new({
  'name'=>'Obiwan',
  'species'=>'Earthling',
  'bounty_value'=>50000,
  'danger_level'=>'high'
  })

space_cowboy2=SpaceCowboy.new({
  'name'=>'Obiwan',
  'species'=>'Earthling',
  'bounty_value'=>50000,
  'danger_level'=>'high'
  })

space_cowboy1.save()
space_cowboy2.save()

space_cowboy1.name="An SQL Database"
space_cowboy1.update()

space_cowboy1.delete()

space_cowboys = SpaceCowboy.all

binding.pry


nil