#!/usr/bin/ruby -w
# iTUNES
# Copyright Markk Keane, All Rights Reserved, 2014

#This is the top level
require 'csv'
require_relative 'actor'
require_relative 'album'
require_relative 'song'
require_relative 'reader'
require_relative 'utilities'
require_relative 'error'

#songs_file = ARGV[0]                  #for command line
#owners_file = ARGV[1]                 #for command line

reader = Reader.new
songs_file = 'songs.csv'             #in RubyMine
owners_file = 'owners.csv'           #in RubyMine

puts "\nProcessing Songs from file: #{songs_file}"
$songs = reader.read_in_songs(songs_file)

puts "Processing Ownership from file: #{owners_file}"
$hash_owners = reader.read_in_ownership(owners_file)

def check_input?                                 #To check whether .csv files have the wrong input of id
	
	$songs.each do |song|                        #go through the array song 
		if $hash_owners[song.id] ==nil           #if a id in song doesn't have a counterpart in hash map,it will return false
      	 
      	 puts song.name+" does not have any owners and it may cause some errors!!!!"
      	 false
    	end
	end
	true                                         #else return true
end


	

puts "Building all owners..."
$actors = Actor.build_all()

puts "Updating songs with ownership details..."
$songs.each{|song| song.owners = $hash_owners[song.id]}

puts "Building All Albums..."
puts "\nPrinting full details of all albums..."
begin
    if !check_input?
		raise "An error has occured"
	end
$albums = Album.build_all()                  #invoking build_all()
puts "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
$albums.each {|album| p album}               #output the details of each album
puts "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
rescue
	puts "It seems something goes wrong perhaps it is because of the wrong input of id!!!"
end
# Given the name of a song and a person; let them buy the song
puts "\nMarkk buys Rain(remix)..."
song1 = Util.fetch("Rain(remix)")
Markk =   Util.fetch("markk")
Markk.to_s
song1.to_s
Markk.buys_song(song1)
song1.to_s

# What songs does Markk own
puts "\nHow many songs does Markk own..."
begin
	if !check_input?
		raise "An error has occured"
	end
p Markk.what_songs_does_he_own().size
rescue
	puts "It seems something goes wrong perhaps it is because of the wrong input of id!!!"
end
puts "\nPlay Rain(remix)..."
song1.play_song

# Print out all songs
puts "\nPrinting full details of all songs..."
$songs.each{|song| p song}


# Call it like this in the command line.
# Markkean% ruby itunes.rb songs.csv owners.csv

