require("pry")
require_relative("../models/artist")
require_relative("../models/album")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({ 'name' => 'Queen'})
artist2 = Artist.new({ 'name' => 'Britney'})
artist3 = Artist.new({ 'name' => 'Ed Sheeran'})

artist1.save()
artist2.save()
artist3.save()
# p artist3.name
# artist3.name = "Lord Huron"
# # p artist3.name
# artist3.update()

album1 = Album.new({ 'title' => 'A Kind of Magic', 'genre' => 'Rock', 'artist_id' => artist1.id})
album1.save()

album2 = Album.new({ 'title' => 'Flash Gordon', 'genre' => 'Rock', 'artist_id' => artist1.id})
album2.save()

album3 = Album.new({ 'title' => 'Baby One More Time', 'genre' => 'Pop', 'artist_id' => artist2.id})
album3.save()

album4 = Album.new({ 'title' => 'Hakuna Matata', 'genre' => 'Disney', 'artist_id' => artist3.id})
album4.save()

p album4
album4.delete()


# p album3.genre
# album3.genre = "90s Pop"
# album3.update()

# Album.find(album3.id)
# p Album.find(album3.id)
# album2.which_artist()
# p album2.which_artist() #this tells us the artist of album2.
# artist1.which_albums()
# p artist1.which_albums()
# Album.all()
# p Album.all()
