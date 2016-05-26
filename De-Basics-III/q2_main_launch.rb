## Copyright Jinghui Lu, All Rights Reserved, 2015
## Student number:15203181


require_relative 'q2_Donor'
require_relative 'q2_BankAccount'

           
donors=[]                                                                                        #variables for donors instore
i=0
f=File.open('q2_Donor.txt', 'r')                                                                 #import donors data from txt
f.each_line do |line|
  array=line.split(",")
  name=array[0]
  address=array[1]
  age=array[2].to_i
  amount_of_donation=array[3].to_i
  cumulative_donation=array[4].to_i
  humanitarian=array[5]
 
 

  donors[i]=Donor.new(name, address, age, amount_of_donation, cumulative_donation, humanitarian) #put the data into donors array
  i+=1
end
f.close()

accounts=[]                                                                                      #variables for accounts instore
t=0

f1=File.open('q2_BankAccount.txt','r')                                                           #import bankaccounts data from txt
f1.each_line do |line| 
	array=line.split(",")
	name=array[0]
	owner=array[1]
	balance=array[2].to_i
	donor_status=array[3]
	
	bank_of_account=array[4]

	accounts[t]=BankAccount.new(name, owner, balance, donor_status, bank_of_account)             #put the data into accounts array
	t+=1
end
f1.close()




puts "\033[33mWhich option do you want to choose?\033[0m\n"                                                       #main()
puts "\033[33m1-view donors and accounts information,2-quit \033[0m\n"
flag=gets
num=0

if (flag.to_i==1)                                                                                #if enter 1 show donors and accounts information list
	 
	 then   donors.each do |donor|
	     	accounts.each do |account|
	     		if (account.owner==donor.name)
	     			then num+=1
	     			puts "\033[36mNumber:\033[0m"+num.to_s+"\033[36m Name:\033[0m"+donor.name+"\033[36m Address:\033[0m"+donor.address+"\033[36m Age:\033[0m"+donor.age.to_s+"\033[36m DonationAmount:\033[0m"+donor.amount_of_donation.to_s+"\033[36m DonationSum:\033[0m"+donor.cumulative_donation.to_s+"\033[36m humanitarian:\033[0m"+donor.humanitarian+"\033[36m AccountName:\033[0m"+account.name+"\033[36m Balance:\033[0m"+account.balance.to_s+"\033[36m DonorStatus:\033[0m"+account.donor_status+"\033[36m Bank:\033[0m"+account.bank_of_account
	     			
	     		end
	     	end
	     end
         flag3=1
         while flag3==1 do                                                                       #enter loop for donation procedure
	     	puts "\033[35menter the number to choose a donor to ask for more donation.0-quit\033[0m\n"            #enter a number to choose one to spam for donation
	     	flag1=gets
	     	if (flag1.to_i!=0)
	     		then
                    
	     			flag4=donors[(flag1.to_i-1)].account_to_data?(donors[(flag1.to_i-1)].humanitarian)


	     				if flag4
	     					then puts "\033[31mYou can send a spam for more donation,do you want to spam?1-yes,2-no\033[0m\n"
	     					flag5=gets
	     					if flag5.to_i==1
	     						puts "\033[33mProcessing donation...\033[0m\n"
	     						accounts.each do |account|
	     							if account.owner==donors[(flag1.to_i-1)].name
	     								then flag6=account.is_donation?
	     								if flag6
	     									then flag7=account.in_credit?(donors[(flag1.to_i-1)].amount_of_donation) 
	     									if flag7
	     										puts "\033[33mWell done,you get more donation.\033[0m\n"          #processing donation transaction
	     										account.make_payment(donors[(flag1.to_i-1)].amount_of_donation) 
	     										donors[(flag1.to_i-1)].makes_a_donation
	     										account.account_held_by
	     										account.report_balance
	     										
	     									end
	     								end
	     							end
	     						end
	     					end
	     				end
	     	else flag3=0
	     	end

	     end
end

    f2=File.open("q2_Donor.txt","w")
         str2=""
        donors.each do |i|                                                                        #export donors information
        str2=str2+i.name+","+i.address+","+i.age.to_s+","+i.amount_of_donation.to_s+","+i.cumulative_donation.to_s+","+i.humanitarian.to_s
        end
        f2.puts(str2)
    f2.close()
    
    f3=File.open('q2_BankAccount.txt',"w")
        str="" 
        accounts.each do |i|                                                                      #export bankaccounts information
        str=str+i.name+","+i.owner+","+i.balance.to_s+","+i.donor_status+","+i.bank_of_account
        end
        f3.puts(str)
    f3.close()

