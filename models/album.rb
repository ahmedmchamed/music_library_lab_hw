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

    def save()
        sql = " 
        INSERT INTO albums (
            title,
            genre,
            artist_id
        )
        VALUES
        (
            $1, $2, $3
        )
        RETURNING id;"
        values = [@title, @genre, @artist_id]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i()
    end

    def self.all()
        sql = "SELECT * FROM albums;"
        album_hashes = SqlRunner.run(sql)
        album_objects = album_hashes.map { |album| Album.new(album) }
        return album_objects
    end

    

end