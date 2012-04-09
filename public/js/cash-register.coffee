window.Dish = class Dish
	constructor: (rawDescription) ->
		[all, @title, @price] = @parseRawDescription rawDescription
	parseRawDescription: (rawDescription='') ->
		pattern = ///
			([^\$]+)      # Title
			(\$\d+\.\d+) # Dollar Amount
		///
		result = rawDescription.match pattern
		r.trim() for r in result

window.Money = class Money
	constructor: (rawString) ->
		@cents = @parseCents rawString
	
	parseCents:(rawString) ->
		[dollars,cents] = (rawString.match(/(\d+)/g) ? [0,0])
		+cents + 100*dollars
	toString: ->
		"$#{Math.floor(@cents /100)}.#{@cents % 100}"