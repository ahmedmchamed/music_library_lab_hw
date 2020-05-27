require_relative('../db/sql_runner')

class Artist

    attr_accessor :name
    attr_reader :id

    def initialize(options)
        @name = options['name']
        @id = options['id'].to_i() if options['id']
    end

    def save_artist()
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

    def delete_artist()
        sql = "DELETE FROM artists WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def edit_artist(new_name)
        sql = "UPDATE artists SET
        (name)
        =
        ROW($1)  
        WHERE id = $2;"
        values = [new_name, @id]
        SqlRunner.run(sql, values)
    end

    def albums_by_artist()
        sql = "SELECT * FROM albums WHERE artist_id = $1"
        values = [@id]
        albums = SqlRunner.run(sql, values)
        return albums.map { |album| Album.new(album) }
    end

    def self.display_all_artists()
        sql = "SELECT * FROM artists;"
        artist_hashes = SqlRunner.run(sql)
        artist_objects = artist_hashes.map { |artist| Artist.new(artist) }
        return artist_objects
    end

    def self.delete_all_artists()
        sql = "DELETE FROM artists;"
        SqlRunner.run(sql)
    end

end