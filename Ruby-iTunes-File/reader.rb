#!/usr/bin/ruby -w
# READER
# Copyright Mark Keane, All Rights Reserved, 2014

#  Class that reads in things from different files.
class Reader
	# method to read in songs from the songs.csv file.
  # returns an array of song objects.

	def read_in_songs(csv_file_name)
	  songs = []
	  
	  CSV.foreach(csv_file_name, :headers => true) do |row|
		 songname, artist, album, time, id = row[0],row[1], row[2], row[3], row[4]
	 	 unless (songname =~ /#/)
	 	 	 if !check?(id,"owners.csv")                                          #invoke check? to prompt error
	 	 	 	puts "There is something wrong happend when input the songs.csv!!!!!!!!!!!!!!!!!!!!!!"
	 	 	 end
	 	 	 songs << Song.new(songname,album,artist,time.to_f,nil,id)
	 	 end
	   end
	    
	  songs
	end
	   
	# method to read in owners and the ids of the songs they own from the owners.csv file.
  # returns a hash table where the keys are song-ids and the values are the owners this song (a string)

	def read_in_ownership(csv_file_name, temp_hash = Hash.new)
	  CSV.foreach(csv_file_name, :headers => true) do |row|
		  song_id, owner_data = row[0], row[1]
	 	  unless (song_id =~ /#/)
	 	 	     temp_hash[song_id] = owner_data
	 	      end
    end
    temp_hash
	end

	def check?(id,csv_file_name,temp_hash = Hash.new)              #check the input
		CSV.foreach(csv_file_name, :headers => true) do |row|      #exam whether all songs id have corresponding id in owner.csv
		  song_id, owner_data = row[0], row[1]
	 	  unless (song_id =~ /#/)
	 	 	     temp_hash[song_id] = owner_data
	 	      end
	 	  end
	 	if temp_hash[id]==nil                                      #once a id in song doesn't have a counterpart in hash map,it will return false
	 		false
	 	else
	 		true
	 	end
	 end

end
