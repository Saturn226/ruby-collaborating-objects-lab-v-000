class Song
  attr_accessor :name, :artist
  @@all = []
  def initialize(name)
    @name = name
  end
  
  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    self.artist = artist
    self
  end
  
  def save
    @@all << self
  end
  
  def self.new_by_filename(filename)
    artist_name, song_name, genre_name = filename.split(" - ")
    song = Song.new(song_name)
    song.artist_name = artist_name
    song.save
    song
  end
end