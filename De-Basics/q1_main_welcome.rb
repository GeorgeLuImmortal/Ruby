## Copyright Jinghui Lu, All Rights Reserved, 2015
## Student number:15203181
require_relative 'q1_hello'
require_relative 'q1_title'  

def get_name 
	puts "What is your surname?:" 
	name = gets.chomp               #get value from screen 
	name1=get_title(name)           #invoke get_title()
	print_hello(name1)              #invoke print_hello()
end

get_name
