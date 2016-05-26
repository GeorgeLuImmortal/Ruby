1) The	main	task	this	week	is	to	get	the	iTunes	program	going and	see	how	it	runs.		
Start	by	looking	at	the	two	.csv	files.		Change	these	to	be	your	own	songs,	and	
make	sure	the	owners	list	corresponds	to	what	you	have	done.
2) The	methods	for	building	all	albums	are	empty.		Please	do	them and	make	them	
work	properly.
3) In	the	utilities.rb file		we	have,	within	the	Array	class, is	this:
 def clean_up()
 self.join(" ").split(" ").uniq #this could be more elegant
 end
The	second	line	of	this	method	works	but	it	looks	a	bit	inelegant	and	if	you	end
up	with	a	few	million	songs,	it will	gobble	memory	and	time.			Can	you	make	it	
better?
4) If	you	get	the	song-ids	wrong in	the	.csv	files,	all	hell	breaks	loose.		Check	this.		
The	think	about	adding	some	methods	to	the	program	that	could	do	some	simple	
checks	to	catch	such	input	errors.
