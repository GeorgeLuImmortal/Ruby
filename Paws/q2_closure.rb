#using block and yield to define some kinds of function about file such as print

class File
	def self.open_and_process(*args)
  		f = File.open(*args)
  		yield f                               # yield is a placeholder
  		f.close
 	end
end
 
File.open_and_process("testfile.txt","r") do |file|  # output contents in file 
 	while line = file.gets 
  		puts line
 	end
end

puts


#using lambda to implement fibonacci in limited boundary

fibUpTo=lambda do |max|
  i1,i2=1,1                      #parameter assignment 
  while i1<=max                  #the fibonacci number can bigger than the value of max
    print i1," " 
    i1, i2 =i2,i1+i2 
  end 
end 

fibUpTo.call(1000)               # set max 1000
puts
fibUpTo.call(2000)               # set max 2000
puts
fibUpTo.call(100)                # set max 100