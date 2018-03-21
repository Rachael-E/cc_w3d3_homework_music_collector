require('pg')
require_relative('../db/sql_runner')

class Album
  attr_reader :id
  attr_accessor :title, :genre

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
  sql = "INSERT INTO albums
  (title, genre, artist_id)
  VALUES
  ($1,$2,$3)
  RETURNING id"
  values = [@title, @genre, @artist_id]

  result = SqlRunner.run( sql, values )

  @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE albums
    SET genre = $1
    WHERE id = $2
    ;
    "
    values = [@genre, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums_hashes = SqlRunner.run(sql)
    album_objects = albums_hashes.map{|album| Album.new(album)}
    return album_objects
  end

  def which_artist()
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    artist_hash = results[0]
    artist = Artist.new(artist_hash)
    return artist
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    album_hash = results.first
    album = Album.new(album_hash)
    return album
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)

  end


end
