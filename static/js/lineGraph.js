var files = ["lineData.csv", "lineData2.csv"];
var color = ["red", "blue"];
	
		//Dimensions of Graph w/ margins
		var margin = {top: 20, right: 20, bottom: 30, left: 50};
		var w = 500 - margin.left - margin.right;
		var h = 375 - margin.top - margin.bottom;
		
		//Creates canvas which will display the graph
		var canvas = d3.select("#foo").append("svg")
			.attr("width", w + margin.left + margin.right)
			.attr("height", h + margin.top + margin.bottom)
			.append("g")
			.attr("transform", "translate(" +margin.left + "," +margin.top + ")");
			
		//X and Y scales
		var x = d3.scale.linear().range([0, w]);
		var y = d3.scale.linear().range([h, 0]);
		
		//X and Y axes
		var xAxis = d3.svg.axis()
			.scale(x)
			.ticks(10)
			.orient("bottom");
		var yAxis = d3.svg.axis()
			.scale(y)
			.ticks(10)
			.orient("left");
			
		//Creates Line object
		var line = d3.svg.line()
			.x(function (d) {return x(d.x);})
			.y(function (d) {return y(d.y);});
			
		//Fills are under the curve
		var area = d3.svg.area()
			.x(function(d){return x(d.x);})
			.y0(h)
			.y1(function(d){return y(d.y);});
		
for(i = 0; i < files.length; i++){	
	//Reads in CSV data file
	d3.csv("static/js/FABLE_Graph_Data/" + files[i], function(data) {	
	
		//determines the Domain and range of the graph
		x.domain(d3.extent(data, function(d) {return +d.x;}));
		y.domain(d3.extent(data, function(d) {return +d.y;}));
		
		//Draws axes by appending them to the canvas
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
		
		//Draws gridlines		
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
			
		//Draws line
		canvas.selectAll(".lines")
			.data([data])
			.enter()
				.append("path")
				.attr("d", function (d){return line(d);})
				.attr("class", "lines")
				.style('stroke', 'black')
				.style('fill', 'none');
		
		//Fills in area under the curve
		/*canvas.selectAll(".areas")
			.data([data])
			.enter()
				.append("path")
				.attr("d", function(d){return area(d);})
				.attr("class", "areas")
				.attr("fill", color[i]);*/
	});
}		
			
		
		