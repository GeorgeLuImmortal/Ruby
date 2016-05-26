Lets set up three files two of which define specific classes and a third which uses these classes to run a separate program (up to you whether you want this to be a class too).
FILE1 contains the class Bank, that has attributes of no-of-employees, cash- deposits, amount-of-loans, losses, in_nama, solvent etc. For a bank to be solvent under the new Basil Rules, it must have a loan_book that is no more than six times the value of its cash-deposits less any losses. If it becomes insolvent then it needs to off-load some of its loans to NAMA; NAMA takes on these loans and gives the Bank cash for them, that the bank adds to its cash-deposit amount. However, NAMA will only pay a Bank 30% of the face value of the loans it takes on (because those loans may tank and be worth nothing). Believe it or not, this arrangement keeps everyone (sort of) happy.
Define three methods for the Bank class:
• move_loans_to_nama which takes a quantity of loans from a bank and transfers them to NAMA, and transfers the 30% cash payment back to the Bank’s cash deposits; adjusting all the relevant attributes (cash-deposits, net_capital, etc) in the bank and nama objects involved.
• is_insolvent which determines if a bank is technically insolvent
• make_solvent that makes a bank solvent by moving some quantity of its
loans to NAMA (and getting some cash to increase it core cash/deposits).
Create 6 instances of this object: AIB, Anglo, BOI, RBS, Ulster (and NAMA as a special bad bank).
FILE2 contains the class Developer that has five attributes: name, net-worth, loans, banks_loaned_from and bankrupt (stuff like this). It has three methods: is_developer_solvent?, owes_amount, owes_bank. Create 5 instances of this object: Johnny Ronan, Murtagh, Lowry and so on.
FILE3 should use the two classes to decide who should be declared-bankrupt and when made bankrupt, the knock on effect for the bank concerned. So, if the developer is made bankrupt then all his loans are void, then those loans become a loss for the back, damaging its solvency and triggering the movement of loans to NAMA. If you really get it going, it should iterate bankrupting developers and forcing banks to unload their loans to NAMA (meanwhile NAMA gets rich).
Somewhere in all of this you need to write methods that uses each and do..end to iterate through either the instances of developers or the instances of banks, or indeed both. Also, while you are at it, use some fancy I/O methods.
Its up to you how complicated you want to make the last step . But, my advice is to start simple.