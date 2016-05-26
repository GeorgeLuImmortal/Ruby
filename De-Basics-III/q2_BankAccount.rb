## Copyright Jinghui Lu, All Rights Reserved, 2015
## Student number:15203181


class BankAccount
	attr_accessor :name,:owner,:balance,:donor_status,:bank_of_account

	def initialize(name, owner, balance, donor_status, bank_of_account)
    	@name=name
   		@owner=owner
    	@balance=balance
   		@donor_status=donor_status                                                      #whether donated recently
    	@bank_of_account=bank_of_account
  	end

  def is_donation?                                                                    #if donor_status is yes means donor donated recently and will not donate and return false
    if donor_status=="yes"                                                            #else return true
      then puts "This donor has donated recently and don't want to donate again."
      false
    
    else puts "Begin checking credit."
      true
    end
  end

  def make_payment(amount)                                                            #reduce the balance and change donor_status
  		@balance-=amount
  		@donor_status="yes"
  end

  def report_balance                                                                  #show account balance
  		puts "Balance is "+@balance.to_s
  end

  def account_held_by                                                                 #show account owner
  		puts "This account is held by "+@owner
  end

  def in_credit?(amount)                                                              #whether donor is in credit,balance should more than the amount of a donation
  		if @balance > amount
     		 puts "Yes, this donor is in credit."
     		 true
     	else puts "Oh no,this donor is not in credit and don't have enough money for donation."
     		false
     	end
  end

  end