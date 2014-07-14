var data = [
					{"x":0, "y":70},
					{"x":1, "y":64},
					{"x":2, "y":32},
					{"x":3, "y":16},
					{"x":4, "y":8},
					{"x":5, "y":7},
					{"x":6, "y":0},
					{"x":7, "y":1},
					{"x":8, "y":5},
					{"x":9, "y":8},
					{"x":10, "y":3},
					{"x":11, "y":7},
					{"x":0, "y":0},
					{"x":1, "y":30},
					{"x":2, "y":17},
					{"x":3, "y":8},
					{"x":4, "y":4},
					{"x":5, "y":5},
					{"x":6, "y":11},
					{"x":7, "y":8},
					{"x":8, "y":5},
					{"x":9, "y":20},
					{"x":10, "y":13},
					{"x":11, "y":7},
					{"x":12, "y":17},
					{"x":13, "y":8},
					{"x":14, "y":4},
					{"x":15, "y":5},
					{"x":16, "y":11},
					{"x":17, "y":13},
					{"x":18, "y":9},
					{"x":19, "y":20}
				];
		
		var margin = {top: 20, right: 20, bottom: 30, left: 50};
		var w = 500 - margin.left - margin.right;
		var h = 375 - margin.top - margin.bottom;
		
		var x = d3.scale.linear().range([0, w]);
		var y = d3.scale.linear().range([h, 0]);
		
		var xAxis = d3.svg.axis()
			.scale(x)
			.ticks(10)
			.orient("bottom");
		var yAxis = d3.svg.axis()
			.scale(y)
			.ticks(10)
			.orient("left");
		var canvas = d3.select("#foo").append("svg")
			.attr("width", w + margin.left + margin.right)
			.attr("height", h + margin.top + margin.bottom)
			.append("g")
			.attr("transform", "translate(" +margin.left + "," +margin.top + ")");
			
		x.domain(d3.extent(data, function(d) {return d.x;}));
		y.domain(d3.extent(data, function(d) {return d.y;}));
		
		canvas.append("g")
			.attr("class", "x Axis")
			.attr("transform", "translate(0, " + h +")")
			.call(xAxis)
			.append("text")
				.attr("transform", "translate("+(w - margin.right) + ",-5)")
				.text("Label");
		canvas.append("g")
			.attr("class", "y Axis")
			.call(yAxis)
			.append("text")
				.attr("transform", "rotate(-90)")
				.attr("y", 6)
				.attr("dy", ".71em")
				.style("text-anchor", "end")
				.text("Label");
		
		canvas.selectAll("line.horizontalGrid")
			.data(y.ticks(10))
			.enter()
				.append("line")
				.attr(
				{
					"class":"horizontalGrid",
					"x1" : 0,
					"x2" : w,
					"y1" : function(d){ return y(d);},
					"y2" : function(d){ return y(d);},
					"fill" : "none",
					"stroke" : "black",
					"stroke-width" : "0.71px"
				});
			
		canvas.selectAll("circle")
			.data(data)
			.enter()
				.append("circle")
				.attr("cy", function(d){return y(d.y);})
				.attr("cx", function (d, i){return x(d.x);})
				.attr("r", 3)
				.attr("fill", "red");