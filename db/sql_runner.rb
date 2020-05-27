require( 'pg' )

class SqlRunner

    def self.run(sql, values = [])
        begin
            db = PG.connect( {dbname: "music_collections", host: "localhost"} )
        

end