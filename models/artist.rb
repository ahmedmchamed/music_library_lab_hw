require_relative('../db/sql_runner')

class Artist

    attr_accessor :name
    attr_reader :id

    def initialize(options)
        @name = options['name']
        @id = options['id'].to_i() if options['id']
    end

    def save()
        sql = "INSERT INTO artists
        (
            name
        )
        VALUES
        (
            $1
        )
        RETURNING id;"
        values = [@name]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i()
    end

    def delete()
        sql = "DELETE * FROM artists WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.all()
        sql = "SELECT * FROM artists;"
        artist_hashes = SqlRunner.run(sql)
        artist_objects = artist_hashes.map { |artist| Artist.new(artist) }
        return artist_objects
    end

    def self.delete_all()
        sql = "DELETE FROM artists;"
        SqlRunner.run(sql)
    end

    def albums()
        sql = "SELECT * FROM albums WHERE artist_id = $1"
        values = [@id]
        albums = SqlRunner.run(sql, values)
        return albums.map { |album| Album.new(album) }
    end

end