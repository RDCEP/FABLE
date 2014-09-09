var data = [40, 10, 35, 6, 20, 5, 23, 29, 36, 56];
		
		//dimensions of graph
		var margin = {top: 20, right: 20, bottom: 30, left: 50};
		var w = 500 - margin.left - margin.right;
		var h = 375 - margin.top - margin.bottom;
		
		//scales of graph
		var y = d3.scale.linear().domain([0, data.length]).range([h, 0]);
		var x = d3.scale.linear().range([0, w]);
		
		//axes
		var xAxis = d3.svg.axis()
			.scale(x)
			.ticks(10)
			.orient("bottom");
		var yAxis = d3.svg.axis()
			.scale(y)
			.ticks(10)
			.orient("left");
		
		//graph area
		var canvas = d3.select("#foo").append("svg")
			.attr("width", w + margin.left + margin.right)
			.attr("height", h + margin.top + margin.bottom)
			.append("g")
			.attr("transform", "translate(" +margin.left + "," +margin.top + ")");
	
		//Range of graph
		x.domain(d3.extent(data, function(d) {return d;}));
		
		//adding axes to graph area
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
				.attr("transform", "translate(" + margin.right+ ", " + (-1*margin.top) + ")")
				.attr("y", 6)
				.attr("dy", ".71em")
				.style("text-anchor", "end")
				.text("Label");
				
		//adding bars to graph area
		canvas.selectAll("rect")
			.data(data)
			.enter()
				.append("rect")
				.attr("y", function(d, i){return i*(h/data.length);})
				.attr("x", 0)
				.attr("height", 15)
				.attr("width", function (d){return x(d);});