require ('pg')
class SpaceCowboys

attr_accessor :name, :species, :bounty_value, :danger_level

def initialize(params)
  @name=params['name']
  @species=params['species']
  @bounty_value=params['bounty_value'].to_i
  @danger_level=params['danger_level']
end

def save()
  db=PG.connect({dbname: 'cowboys', host:'localhost'})
  sql="INSERT INTO space_cowboys
  (name, species, bounty_value, danger_level)
  VALUES
    ('#{@name}','#{@species}',#{@bounty_value},'#{danger_level}');"
  result = db.exec(sql)
  db.close
  # return result
end

end