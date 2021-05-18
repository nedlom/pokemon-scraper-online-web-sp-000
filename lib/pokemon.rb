class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  def initialize(id: nil, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    pokemon = self.new(name: name, type: type, db: db)
    pokemon.save
  end
  
  def self.find(id, db)
    sql = <<-SQL
      SELECT * 
      FROM pokemon
      WHERE id = ?
      LIMIT 1
    SQL
    
    row = db.execute(sql, id)[0]
    
    binding.pry
  end
  
  def save
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
      SQL
      
    self.db.execute(sql, self.name, self.type)
    x = self.id = self.db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
  
  
end
