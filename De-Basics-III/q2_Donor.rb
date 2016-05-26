## Copyright Jinghui Lu, All Rights Reserved, 2015
## Student number:15203181


class Donor
	attr_accessor:name,:address,:age,:amount_of_donation,:cumulative_donation,:humanitarian

	def  initialize(name,address,age,amount_of_donation,cumulative_donation,humanitarian)
		@name=name
		@address=address
		@age=age
		@amount_of_donation=amount_of_donation    #the amount of one donation
		@cumulative_donation=cumulative_donation  #the amount of donation sum
		@humanitarian=humanitarian                #donor's humanitarian
	end

	def makes_a_donation
		@cumulative_donation+=@amount_of_donation
		puts "Now the Donors's cumulative_donation is "+@cumulative_donation.to_s
	end

	def account_to_data?(human)                   #decide whether a donor can be made a spam for money
		
		if (human.chomp=="yes")                   #if humanitarian is yes and donation sum <120000, can be spammed
			then
			if @cumulative_donation<120000
				then puts "This donor is not a large donor,you can send a spam to ask for more donation."
				true
			else puts "This donor is a large donor,please don't disturb."
				false
			end
		else puts "This donor has no humanitarian,please don't disturb."
			false
		end
	end
end