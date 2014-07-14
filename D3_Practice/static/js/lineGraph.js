var data = [
					{"x":0, "y":80},
					{"x":1, "y":64},
					{"x":2, "y":32},
					{"x":3, "y":16},
					{"x":4, "y":13},
					{"x":5, "y":12},
					{"x":6, "y":9},
					{"x":7, "y":27},
					{"x":8, "y":68},
					{"x":9, "y":70},
					{"x":10, "y":60},
					{"x":11, "y":55},
					{"x":12, "y":52},
					{"x":13, "y":48},
					{"x":14, "y":40},
					{"x":15, "y":24},
					{"x":16, "y":30},
					{"x":17, "y":31},
					{"x":18, "y":33},
					{"x":19, "y":37},
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
			
		var line = d3.svg.line()
			.x(function (d) {return x(d.x);})
			.y(function (d) {return y(d.y);});
		var area = d3.svg.area()
			.x(function(d){return x(d.x);})
			.y0(h)
			.y1(function(d){return y(d.y);});
		
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
				.attr("transform", "translate("+(w/2) + ",25)")
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
			
		canvas.selectAll(".lines")
			.data([data])
			.enter()
				.append("path")
				.attr("d", function (d){return line(d);})
				.attr("class", "lines")
				.style('stroke', 'black')
				.style('fill', 'none');
		canvas.selectAll(".areas")
			.data([data])
			.enter()
				.append("path")
				.attr("d", function(d){return area(d);})
				.attr("class", "areas")
				.attr("fill", "lightsteelblue");
		
			
		
		
		
		
		
		
		
		