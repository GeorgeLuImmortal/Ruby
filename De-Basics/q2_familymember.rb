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
    
    def parent?                                     #distinguish by age,more then 30 is parent
    	@name=name
    	@age=age
    	@sex=sex
    	if age>30                                      
    		if sex=="male"                          #classifid by gender
    			then puts name+" is "+"parent"
    			     puts name+" is "+"father"
    			true
    		elsif sex=="female"
    		 	 puts name+" is "+"parent"
    			 puts name+" is "+"mother"
    			true
    		else puts name+" is "+"dog"
    			true
    		end
    	else puts name+" is "+"Not parent"
    		false
    	end
    end

    def child?                                      #distinguish by age less then 30 is child
    	@name=name
    	@age=age
    	@sex=sex
    	if age<=30                       
    		if sex=="male"                          #classified by gender
    			then puts name+" is "+"child"
    			     puts name+" is "+"son"
    			true
    		elsif sex=="female"
    		 	 puts name+" is "+"child"
    			 puts name+" is "+"daughter"
    			true
    		else puts name+" is "+"dog"
    			true
    		end
    	else puts name+" is "+"Not child"
    		false
    	end
    end
end
 
	fm1 = FamilyMember.new("George","male",40,"married","cook")   #create instances
	fm2 = FamilyMember.new("Maria","female",40,"married","cook")
	fm3 = FamilyMember.new("Cork","male",14,"married","cook")
	fm4 = FamilyMember.new("Sunny","female",12,"married","cook")
	fm5 = FamilyMember.new("Ruby","Not human",11,"married","cook")


	fm1.parent?
	fm1.child?
	fm2.parent?
	fm2.child?
	fm3.parent?
	fm3.child?
	fm4.parent?
	fm4.child?
	fm5.parent?
	fm5.child?