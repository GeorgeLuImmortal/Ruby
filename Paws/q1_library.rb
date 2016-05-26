require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database  => "library")

class User < ActiveRecord::Base
  has_many :books
end

class Book < ActiveRecord::Base
  belongs_to :user
end


if (User.table_exists? || Book.table_exists?)    # if table exist, it will skip create process
  puts "table exists"
  else  ActiveRecord::Schema.define do                       #create table
			create_table :users do |table|
			table.column :name, :string                  #user name
			table.column :age, :integer                  #user age
			table.column :books_borrowed, :integer       #how many books he borrow
		end

			create_table :books do |table|
			table.column :user_id, :integer              # borrower's id
			table.column :borrower, :string              # borrower's name
			table.column :title, :string                 # books title
			table.column :borrowed_when, :string         # borrow time
			table.column :dueback, :string               # dueback
		end

		# insert records
		user = User.create(:name => 'George', :age => 20, :books_borrowed => 3)
		user.books.create(:title => 'Flying Dutch', :borrower=> 'George', :borrowed_when => '13/3/2015', :dueback => '13/10/2015')
		user.books.create(:title => 'Atmosphere', :borrower=> 'Geroge', :borrowed_when => '2/10/2015', :dueback => '2/11/2015')
		user.books.create(:title => 'Open the windows', :borrower=> 'Geroge', :borrowed_when => '2/10/2015', :dueback => '2/11/2015')

		user2 = User.create(:name => 'Maria', :age => 25, :books_borrowed => 4)
		user2.books.create(:title => 'Damn Cold', :borrower=> 'Maria',:borrowed_when => '13/02/2015', :dueback => '20/12/2015')
		user2.books.create(:title => 'Hi Baby', :borrower=> 'Maria',:borrowed_when => '2/03/2015', :dueback => '1/12/2015')
		user2.books.create(:title => 'Catastrophe',   :borrower=> 'Maria',:borrowed_when => '20/03/2011', :dueback => '1/10/2015')
		user2.books.create(:title => 'Damn Hot', :borrower=> 'Maria',:borrowed_when => '2/03/2015', :dueback => '1/12/2015')
	end
end





puts "-----------------------"
puts "find the user named George"        #find user named George
puts "-----------------------"
begin
	p User.find_by_name("George")
rescue
	puts "Something goes wrong...."
end


puts "-----------------------"
puts "find the 7th books"                #find the id 7 in book table
puts "-----------------------"
begin
	p Book.find(7)
rescue
	puts "Something goes wrong...."
end

puts "-----------------------"
puts "find the books named Catastrophe"  # find book named Catastrophe
puts "-----------------------"
begin
	p Book.find_by_title("Catastrophe")
rescue
	puts "Something goes wrong...."
end

puts "-----------------------"
puts "find the books named God"  # find book named God
puts "-----------------------"
begin
	p Book.find_by_title("God")
rescue
	puts "Something goes wrong...."
end

puts "-----------------------"
puts "find the books named God"  # find book named God
puts "-----------------------"
begin
	p Book.find_each
rescue
	puts "Something goes wrong...."
end