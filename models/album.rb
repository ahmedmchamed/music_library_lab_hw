require_relative('../db/sql_runner')

class Album

    attr_accessor :name, :title, :genre
    attr_reader :id, :artist_id

    def initialize(options)
        @title = options['title']
        @genre = options['genre']
        @id = options['id'].to_i() if options['id']
        # @artist_id = options['artist_id'].to_i()
    end

    def save()
        sql = " 
        INSERT INTO albums (
            title,
            genre
        )
        VALUES
        (
            $1, $2
        )
        RETURNING id"
        values = [@title, @genre]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i()
    end
        
    

end