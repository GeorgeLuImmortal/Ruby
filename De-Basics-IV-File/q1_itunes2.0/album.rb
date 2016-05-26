#!/usr/bin/ruby -w
# ALBUM
# Copyright Mark Keane, All Rights Reserved, 2014
require_relative 'predicate'
# Class that encodes details of an album.
class Album
	include Pred
	attr_accessor :name, :tracks, :length, :artist,:owners, :id
	def initialize(name, tracks, length, artist, owners)
		@name = name
		@tracks = tracks
		@length = length
		@artist = artist
    	@owners = owners
		@id = name.object_id
	end

  # Method that prints out the contents of an album object nicely.
	def to_s
		puts "The album #{@name} by #{@artist}. \n"
	end	

  # Method that checks if an object given to it is an album.
	def isa?
		instance_of?(Album)
	end

  # Method makes an album object; just uses Album.new; really
  # just being a bit explicit and obvious.

	def self.make_album(name,tracks, length, artist, owners)
		Album.new(name, tracks, length, artist, owners)
	end

  # Class Method that builds albums from song object's contents.
  # It returns an array of album objects.  It calls another class method that
  # builds a single album, given the name of that album.

  def self.build_all(data,albums = [])
    album_names = data.songs.collect{|song| song.album}
    album_names.uniq.each do |album_name|
    	albums << self.build_an_album_called(data, album_name)
    end
    albums
  end

  # Class method that takes an album name, it finds all the sounds that are in that album
  # builds up arrays of the song-names (tracks), runtimes, artist names.  These all get used
  # to populate the various attributes of the album object.

  def self.build_an_album_called(data,album_name)
     tracks=Array.new                          #array for instore all songs in this album
     length=0                                  #counting the total length of the album
     artist=""                                 #the artist of the album
     owner=""                                  #the owner of the album

     data.songs.each do |song|
     	if song.album==album_name                       #once a song's album is corresponding to a album's name
     		tracks<<song.name                             #the track should contain this song
     		length+=song.time                             #the song's length should be accumulative in the total length
     		artist=song.artist                            #update artist(but usually songs that come from same album have the same artist)
     		if !(owner.include?(song.owners))             #if the album's owner have the song's owner already, owner will not change,else update owners
     			song_owner=song.owners.split(" ")           #form an array of song's owners
          		a_owner=(owner.split(" ")+song_owner).uniq  #form an array of song's owners and album's owners and eliminate duplicates
          		owner=a_owner.join(" ")                     #rejoin a_array to form string owner
     		end                                          
     	end
     end

     make_album(album_name,tracks,length,artist,owner) #invoke make_album to build a new album.
  end

end
