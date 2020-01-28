class Pokemon
    attr_reader :id, :name, :type, :hp, :db
    @@all = []

    def initialize(id:, name:, type:, hp: nil, db:)
        @id = id
        @name = name
        @type = type
        @hp = hp
        @db = db
        @@all << self
    end

    def self.save(name, type, database_link)
        database_link.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
    end
    
    def self.find(id, database_link)
        pokemon = database_link.execute("SELECT * FROM pokemon WHERE id = ?")
        name = pokemon[1]
        type = pokemon[2]
        hp = pokemon[3]

        new_pokemon = Pokemon.new(id: id, name: name, type: type, hp: hp, db: database_link)
    end

end
