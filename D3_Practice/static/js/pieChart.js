	var data = [
				{"name":"Agrochemical" ,"perc": 1, "color":"yellow"},
				{"name":"Agricultural" ,"perc": 2, "color":"orange" },
				{"name":"Livestok Farming" ,"perc": 3, "color":"red" },
				{"name":"Food Processing" ,"perc": 4, "color":"darkRed" },
				{"name":"Biofuels" ,"perc": 5, "color":"blue" },
				{"name":"Energy" ,"perc": 6, "color":"darkBlue" },
				{"name":"Forestry" ,"perc": 7, "color":"darkGreen" },
				{"name":"Timber" ,"perc": 8, "color":"brown" },
				{"name":"Ecosystem Services" ,"perc": 8, "color":"green" }
				];
				
	var w = 500;
	var h = 375;
	var margin = 20;

	var r = 150;
			
	var canvas = d3.select("#foo").append("svg")
		.attr("width", w)
		.attr("height", h)
		.append("g")
			.attr("transform", "translate(" + r + "," + r + ")" );
			
	var arc = d3.svg.arc()
		.innerRadius(0)
		.outerRadius(r);
		
	var pie = d3.layout.pie()
		.value(function (d){ return d.perc; });
		
	var arcs = canvas.selectAll(".arc")
		.data(pie(data))
		.enter()
			.append("path")
			.attr("d", arc)
			.attr("class", "arc")
			.attr("fill", function(d){ return d.data.color; });

	canvas.selectAll("rect")
				.data(data)
				.enter()
					.append("rect")
					.attr("y", function(d, i){ return (i*h/17) - (2*r/3); })
					.attr("x", (7*r/6))
					.attr("width", (r/11))
					.attr("height", (r/11))
					.attr("fill", function(d) {return d.color;});
						
	canvas.selectAll("text")
				.data(data)
				.enter()
					.append("text")
						.attr("y", function(d, i){ return (i*h/17) - (3*r/5); })
						.attr("x", (4*r/3))
						.attr("fill", "black")
						.text(function(d){return d.name;});		
			
	
	