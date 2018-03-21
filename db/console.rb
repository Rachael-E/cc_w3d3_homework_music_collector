require("pry")
require_relative("../models/artist")
require_relative("../models/album")

artist1 = Artist.new({ 'name' => 'Queen'})
artist2 = Artist.new({ 'name' => 'Britney'})
artist3 = Artist.new({ 'name' => 'Ed Sheeran'})

artist1.save()
artist2.save()
artist3.save()

album1 = Album.new({ 'title' => 'A Kind of Magic', 'genre' => 'Rock', 'artist_id' => artist1.id})
album2 = Album.new({ 'title' => 'Flash Gordon', 'genre' => 'Rock', 'artist_id' => artist1.id})
album3 = Album.new({ 'title' => 'Baby One More Time', 'genre' => 'Pop', 'artist_id' => artist2.id})

album1.save()
album2.save()
album3.save()