#!/usr/bin/ruby -w
# INHERIT
# Copyright Jinghui Lu, All Rights Reserved, 2015

class Vehicle    # vehicle class may including cars, ships and planes and so on
	attr_accessor :name,:load,:tyres,:engine,:original_place,:vehicle_age,:wings,:floatage
	def initialize(name,load,original_place,vehicle_age)
		@name=name                           
		@load=load                       # the capacity of the vehicle
		@original_place=original_place   # the produce place of the vehicle
		@vehicle_age=vehicle_age         # the usage age of the vehicle
		@tyres=true                      # whether it has tyres
		@engine=true                     # whether it has a engine
		@wings=true                      # whether it has wings
		@floatage=true                   # whether it can float
	end

    def validation?                      # to validate the correct input
    	if load.class==Fixnum && vehicle_age.class==Fixnum && name.class==String && original_place.class==String  #validate the input
    		                             # load and age must be integer, name and place must be String
    		true
    	else
    		
    		false
    	end
    end



	def can_fly?                          # to  decide whether it can fly
		if @wings && @engine              # if it has engine and wings , it can fly
			puts "It can fly."
			true
		else
			puts "It can NOT fly."
			false
		end
	end

	def can_float?                        # to decide whether it can float 
		if @floatage                      # if it has floatage it can float
			puts "It can float."
			true
		else
			puts "It can NOT float."
			false
		end
	end

	def can_run?                          # to decide whether it can run on the land
		if @tyres                         # if it has tyres it can run
			puts "It can run."
			true
		else
			puts "It can NOT run."
			false
		end
	end

	def produce_place                     # to find its produce place
		puts "produce place is "+@original_place
	end

	


end


class Land_vehicle < Vehicle              # land vehicles may including cars, bus and so on 
	attr_accessor:type,:speed
	def initialize(name,load,original_place,vehicle_age,type,speed) #annotate it if you test the inheritance of attributes
		super(name,load,original_place,vehicle_age)
		@type=type                        # the type of car such as car, bus , train
		@speed=speed                      # the speed of car
		@wings=false
		@floatage=false
	end

	def validation?                       # to validate the correct input
		                                  # type must be String and speed must be integer
		if load.class==Fixnum && vehicle_age.class==Fixnum && name.class==String && original_place.class==String&&type.class==String && speed.class==Fixnum
			
			true
		else
			false	
		end
		
	end

	def type_is                            # to output the type
		puts "type is "+@type
	end

	def speed_is                           # output the speed
		puts "speed is "+@speed.to_s
	end
end

class Private_car < Land_vehicle
	attr_accessor:owner,:brand
     
	def initialize(name,load,original_place,vehicle_age,type,speed,owner,brand)  #annotate it if you test the inheritance of attributes           
		super(name,load,original_place,vehicle_age,type,speed)
		@owner=owner                       # the owner of private car
		@brand=brand                       # the brand of the car
	end

	def validation?                        # to validate the correct input
		                                   # owner and brand must be String
		if load.class==Fixnum && vehicle_age.class==Fixnum && name.class==String && original_place.class==String&&type.class==String && speed.class==Fixnum&&owner.class==String && brand.class==String
			
			true
		else
			
			false
		end
	end

	def type_speed
		puts "type is "+@type+" and speed is "+@speed.to_s  # output the type and speed
	end 

	def brand_is                           # output the brand
		puts "brand is "+@brand
	end

	def owner_is                           # output the owner
		puts "owner is "+@owner
	end

	def set_type(type)
		@type=type
	end

	def get_name
		puts "name is "+@name
	end


end

#main
car=Vehicle.new("car1",12,"American",10)

if car.validation?                        # simple validation to check the input
	p car
else
	puts "Invalid input!!!!"
end

sedan_car=Land_vehicle.new("car2",12,"American",10,"sedan car",100)

if sedan_car.validation?                  
	p sedan_car
	# sedan_car.type_speed    # run it for test whether the method can apply up the hierarchy
else
	puts "Invalid input!!!!"
end


volve=Private_car.new("car3",12,"American",10,"advanced sedan car",100,"Michael","Benz") 
# p volve                                 # run it for  test the inheritance of attributes
# volve.set_type("Benz")
# volve.type_is
# volve.get_name

if volve.validation?                      # run it for test the inheritance of methods.
	p volve
	volve.can_run?
	volve.can_float?
	volve.can_fly?
	volve.type_is
else
	puts "Invalid input!!!!"
end