describe "Dish", ->
	
	beforeEach ->
		@dish = new Dish 'Serloin Steak $18.99 mains'
	
	it "extracts title", ->
		(expect @dish.title).toEqual 'Serloin Steak'

	it "extracts price", ->
		(expect @dish.price).toEqual '$18.99'	

describe "Money", ->
	describe "valid value", ->
		beforeEach ->
			@money = new Money '$15.99'
		it "parses to cents", ->
			(expect @money.cents).toEqual 1599
		it "formats correctly to string", ->
			(expect @money.toString()).toEqual '$15.99'
		it "correctly parses a sub 10 cent string", ->
			money = new Money '$0.09'
			(expect money.cents).toEqual '09'

	describe "invalid value", ->
		it "sets cents to 0 if a valid value cant be parsed", ->
			money = new Money 'NOT A DOLLAR'
			(expect money.cents).toEqual 0