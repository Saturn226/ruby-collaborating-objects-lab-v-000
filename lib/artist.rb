class Artist
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def add_song(song)
    @songs << song
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end
  
  def songs
    @songs
  end
  
  def self.find_by_name(name)
    @@all.detect{|artist| artist.name == name}
  end
  
  def save
    @@all << self
  end
  def self.all
    @@all
  end
  
  def print_songs
    songs.each {|song| puts song}
  end
  def self.create_by_name(name)
    artist =  self.new(name)
    artist.save
    artist
  end
end
