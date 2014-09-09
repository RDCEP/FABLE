(function(){

	//instantiates width & height variable for dimensions of the graph
	var w = 500;
	var h = 375;
	
	//instantiates radius variable for size of the pie chart
	var r = h/3;
		
	var color = d3.scale.category20();
		
	//instantiates SVG element (area were the graph will appear)
	var canvas = d3.select("#inspect").append("svg")
		.attr("width", w)
		.attr("height", h)
		.append("g")
			.attr("transform", "translate(" + r + "," + r + ")" );
	
	//gets selected year from the slider
	var year = document.getElementById('year').value;
	
	//reads in CSV file
	d3.csv("static/js/FABLE_Graph_Data/Land_Allocation_Base.csv", function(error, myData) {
	
		color.domain(d3.keys(myData[0]).filter(function(key) { return key !== "date"; }));
	
	//parses data from the CSV
			var data = myData[+year];	
			var names = d3.keys(data).filter(function(key) { return key !== "date"; });
			var values = d3.values(data).filter(function(value) { return value !== data.date; });
	
	//instantiates update object that updates pie chart when the value of the slider changes
		var update = function() {
			var data = myData[+this.value];	
			var names = d3.keys(data).filter(function(key) { return key !== "date"; });
			var values = d3.values(data).filter(function(value) { return value !== data.date; });
			
			arcs.data(pie(values));
			arcs.attr('d', arc);
			
		}
		
		//var color = ["red", "orange", "yellow", "green", "blue"];
		
	
		var arc = d3.svg.arc()
			.innerRadius(0)
			.outerRadius(r);
		
		var pie = d3.layout.pie();
			
	//draws pie chart
		var arcs = canvas.selectAll(".arc")
			.data(pie(values))
			.enter()
				.append("path")
				.attr("d", arc)
				.attr("class", "arc")
				.attr("fill", function(d, i){ return color(names[i]); });

	//draws legend
		canvas.selectAll("rect")
					.data(names)
					.enter()
						.append("rect")
						.attr("y", function(d, i){ return (i*h/17) - (2*r/3); })
						.attr("x", (7*r/6))
						.attr("width", (r/11))
						.attr("height", (r/11))
						.attr("fill", function(d, i) {return color(names[i]);});
							
		canvas.selectAll("text")
					.data(names)
					.enter()
						.append("text")
							.attr("y", function(d, i){ return (i*h/17) - (3*r/5); })
							.attr("x", (4*r/3))
							.attr("fill", "black")
							.text(function(d, i){return names[i] + " " + "(" + values[i] + "GHa)";});
	
	//displays current selected year
		canvas.append("text")
			.attr("transform", "translate(-120" + "," + "-115)")
			.text(function () {return data.date;} );

	//updates pie chart when the value of the slider changes
		d3.select('#year')
			.on('change', update)
			.on('input', update);
	});
})();