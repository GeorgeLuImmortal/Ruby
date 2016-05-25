## Copyright Jinghui Lu, All Rights Reserved, 2015
## Student number:15203181

class FamilyMember
	attr_accessor:name,:sex,:age,:status,:occupation
	
	def initialize(name,sex,age,status,occupation)  #initial method
		@name = name
		@sex = sex
		@age = age
		@status = status
		@occupation = occupation
	end
    
   
end

	fm1 = FamilyMember.new("George","male",40,"married","cook")          #create instances
	fm2 = FamilyMember.new("Maria","female",40,"married","cook")
	fm3 = FamilyMember.new("Cork","male",14,"unmarried","cook")
	fm4 = FamilyMember.new("Sunny","female",12,"unmarried","cook")
	fm5 = FamilyMember.new("Ruby","Not human",11,"unmarried","cook")


	listy=[fm1,fm2,fm3,fm4,fm5]

    def printfamily_with_do(array)                                                               #use iterator to print name and statues
        array.each do |item|
        	puts "name is "+item.name
        	puts "statues is "+item.status
        end
    end

    printfamily_with_do(listy)