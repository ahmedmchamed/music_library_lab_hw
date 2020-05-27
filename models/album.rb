class Album

    attr_accessor :name, :title, :genre
    attr_reader :id, :artist_id

    def initialize(options)
        @title = options['title']
        @genre = options['genre']
        @id = options['id'].to_i() if options['id']
        # @artist_id = options['artist_id'].to_i()
    end

    

end