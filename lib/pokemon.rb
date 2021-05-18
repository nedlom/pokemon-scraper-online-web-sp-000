class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  def initialize(id: nil, name:, type, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save
    pokemon = self.new(name, type, db)
    pokemon.save
  end
  
  def self.find
  end
  
  def save
    sql = <<-SQL
      INSERT INTO pokemon (name, type, db)
      VALUES (?, ?, ?)
      SQL
    
  end
end
