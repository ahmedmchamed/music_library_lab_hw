require('pry-byebug')
require_relative('../models/album')
require_relative('../models/artist')

# Album.delete_all()
# Artist.delete_all()

artist1 = Artist.new( {'name' => 'Elvis'} )
artist2 = Artist.new( {'name' => 'Johnny Cash'} )
artist1.save()
artist2.save()

album1 = Album.new( {'title' => 'Love me tender', 'genre' => 'Rock', 'artist_id' => artist1.id()} )
album2 = Album.new( {'title' => 'Ring of fire', 'genre' => 'Rock', 'artist_id' => artist2.id()} )
album1.save()
album2.save()

binding.pry

nil

