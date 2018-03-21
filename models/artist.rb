require('pg')
require_relative('../db/sql_runner')

class Artist
  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists
    (name)
    VALUES
    ($1)
    RETURNING id"
    values = [@name]

    result = SqlRunner.run( sql, values )

    @id = result[0]['id'].to_i

  end

  def update()
    sql = "UPDATE artists
    SET name = $1
    WHERE id = $2
    ;
    "
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def which_albums() # list all albums by one artist
    sql = "SELECT * FROM albums
          WHERE artist_id = $1"
    values = [@id]
    album_hashes = SqlRunner.run(sql, values)
    album_objects = album_hashes.map {|album_hash| Album.new(album_hash)}
    return album_objects

  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists_hashes = SqlRunner.run(sql)
    artist_objects = artists_hashes.map{|artist| Artist.new(artist)}
    return artist_objects
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end














end
