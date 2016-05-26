class Email
	attr_accessor:emails, :count, :email_no
	
	def initialize(file)
		f = File.open(file, 'r')
		@emails=[]                                               # to store email text
		@count=0                                                 # to calculate the score of spam
		@email_no=0                                              # to store the sequence of email
		begin                                                    # if input text wrong than throw exception
  			if f
   				 puts("Open #{file} successfully\n")
   				 f.each_line do |line|
  					emails << line
  				end
  			end
  		
  		rescue
  			puts("Failed to Open #{file} \n")
      	end
 
	end


	def regular                                                             #using regular expression to test whether email have some spam features 
		@emails.each do |email|
 		 	@email_no+=1
  			words = email.chomp.split(" ")
  			words.each do |word|
   			 	if word.match(/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/) #match the email address
     				@count+=1
   				end
    			if word.match(/\d{3}-\d{7}/)                                 #match the phone number
      				@count+=1
    			end
    			if word.match(/(https?|ftp|mms):\/\/([A-z0-9]+[_\-]?[A-z0-9]+\.)*[A-z0-9]+\-?[A-z0-9]+\.[A-z]{2,}(\/.*)*\/?/) #match the url address
     	 			@count+=1
    			end
    			if word.match(/[Mm]oney/)                                    #the below regular expression is to match some spam words
      				@count+=1
    			end
    			if word.match(/[Ff]ree/)
      				@count+=1
    			end
    			if word.match(/[Ee]arn/)
      				@count+=1
    			end
    			if word.match(/[Ss]ave/)
      				@count+=1
    			end
    			if word.match(/[Rr]egister/)
      				@count+=1
    			end
  			end
  			self.to_s
  			@count=0
  		end
  	end

  	def to_s
  		if @count>0 && @count<10                                                                         # the spam score more than 0 can say it is a spam email
   			 puts "Email #{@email_no}.\033[33m"+emails[@email_no-1]+"\033[0m is a \033[36mSPAM\033[0m."  
    		 puts "The level of spam is #{count}" 
 		elsif @count>=10                                                                                 # the maximum of spam score is 10
   			 puts "Email #{@email_no}.\033[33m"+emails[@email_no-1]+"\033[0m is a \033[36mSPAM\033[0m."
   			 puts "The level of spam is 10"
  		else                                                                                             # the spam score is 0 can say it is a normal email                                                                                
    		 puts "Email #{@email_no}.\033[33m"+emails[@email_no-1]+"\033[0m is a normal email"
 		end
 	end


		
end