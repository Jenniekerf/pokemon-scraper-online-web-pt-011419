class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id,
    @name = name,
    @type = type,
    @db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(number, db) 
    pokemon_by_id = db.execute("SELECT * FROM pokemon WHERE id = ?",number)
    
    id = pokemon_by_id[0][1]
    name = pokemon_by_id[0][2]
    type = pokemon_by_id[0][3]
    
    new_pokemon = Pokemon.new(id:id, name:name, type:type, db:db)
    
    return new_pokemon
  end
  
end
