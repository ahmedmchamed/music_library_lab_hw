require_relative('../db/sql_runner')

class Album

    attr_accessor :name, :title, :genre
    attr_reader :id, :artist_id

    def initialize(options)
        @title = options['title']
        @genre = options['genre']
        @id = options['id'].to_i() if options['id']
        @artist_id = options['artist_id'].to_i()
    end

    def save_album()
        sql = " INSERT INTO albums 
        (title, genre, artist_id)
        VALUES
        ($1, $2, $3)
        RETURNING id;"
        values = [@title, @genre, @artist_id]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i()
    end

    def delete_album()
        sql = "DELETE FROM albums WHERE id = $1;"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def edit_album(new_title = @title, new_genre = @genre)
        sql = "UPDATE albums
        SET
        (title, genre)
        =
        ($1, $2)
        WHERE id = $3;"
        values = [new_title, new_genre, @id]
        SqlRunner.run(sql, values)
    end

    def artist_of_album()
        sql = "SELECT * FROM artists WHERE id = $1;"
        values = [@artist_id]
        artist_result = SqlRunner.run(sql, values)
        return artist_result.map { |artist| Artist.new(artist) }
    end

    def self.display_all_albums()
        sql = "SELECT * FROM albums;"
        album_hashes = SqlRunner.run(sql)
        album_objects = album_hashes.map { |album| Album.new(album) }
        return album_objects
    end

    def self.delete_all_albums()
        sql = "DELETE FROM albums;"
        SqlRunner.run(sql)
    end

    def self.find_album_by_id(id)
        sql = "SELECT * FROM albums WHERE id = $1;"
        values = [id]
        found_album_hash = SqlRunner.run(sql, values)
        return found_album_hash.map { |album| Album.new(album) }
    end

end
