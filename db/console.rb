require('pry-byebug')
require_relative('../models/album')
require_relative('../models/artist')

Album.delete_all_albums()
Artist.delete_all_artists()

artist1 = Artist.new({
    'name' => 'Elvis'
    })
artist2 = Artist.new({
    'name' => 'Johnny Cash'
    })

#INSERTing the artists
artist1.save_artist()
artist2.save_artist()

album1 = Album.new({
    'title' => 'Love me tender', 
    'genre' => 'Rock', 
    'artist_id' => artist1.id()
    })
album2 = Album.new({
    'title' => 'Ring of fire', 
    'genre' => 'Rock', 
    'artist_id' => artist2.id()
    })

#INSERTing the albums
album1.save_album()
album2.save_album()

binding.pry

nil

