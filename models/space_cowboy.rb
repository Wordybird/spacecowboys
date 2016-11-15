require ('pg')
class SpaceCowboy

attr_accessor :name, :species, :bounty_value, :danger_level

def initialize(params)
  @name=params['name']
  @species=params['species']
  @bounty_value=params['bounty_value'].to_i
  @danger_level=params['danger_level']
  @id = params['id'].to_i if params['id']
end

def self.delete_all
  db=PG.connect({dbname: 'cowboys', host:'localhost'})
  sql= "DELETE FROM space_cowboys;"
  db.exec(sql)
  db.close
end

def save()
  db=PG.connect({dbname: 'cowboys', host:'localhost'})
  sql="INSERT INTO space_cowboys
  (name, species, bounty_value, danger_level)
  VALUES
    ('#{@name}','#{@species}',#{@bounty_value},'#{danger_level}')
    returning *;"
  result = db.exec(sql)
  @id=result[0]['id'].to_i
  db.close
  return result
end

def delete()
  return unless @id
  db=PG.connect({dbname: 'cowboys', host:'localhost'})
  sql="DELETE FROM space_cowboys WHERE id=#{@id};"
  db.exec(sql)
  db.close
end

def self.all
  db=PG.connect({dbname: 'cowboys', host:'localhost'})
  sql= "SELECT * FROM space_cowboys;"
  orders = db.exec(sql)
  db.close
  return orders.map{|hash| SpaceCowboy.new(hash)}
end

end