require('pry-byebug')
require_relative('../models/album')
require_relative('../models/artist')

#Album.delete_all()
#Artist.delete_all()

album1 = Album.new( {'title' => 'Love me tender', 'genre' => 'Rock'} )
album2 = Album.new( {'title' => 'Ring of fire', 'genre' => 'Rock'} )
album1.save()
album2.save()
