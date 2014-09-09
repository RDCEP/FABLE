var margin = {top: 20, right: 150, bottom: 30, left: 35},
    width = 480 - margin.left - margin.right,
    height = 250 - margin.top - margin.bottom;

var x = d3.scale.linear()
    .range([0, width]);

var y = d3.scale.linear()
    .range([height, 0]);

var color = d3.scale.category20();

var xAxis = d3.svg.axis()
    .scale(x)
	.tickFormat(d3.format(""))
    .orient("bottom");

var yAxis = d3.svg.axis()
    .scale(y)
	.ticks(6)
    .orient("left");

var area = d3.svg.area()
    .x(function(d) { return x(d.date); })
    .y0(function(d) { return y(d.y0); })
    .y1(function(d) { return y(d.y0 + d.y); });

var stack = d3.layout.stack()
    .values(function(d) { return d.values; });

var svg = d3.select("#foo").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

d3.csv("static/js/FABLE_Graph_Data/Land_Allocation_Base.csv", function(error, data) {

	
  color.domain(d3.keys(data[0]).filter(function(key) { return key !== "date"; }));

  data.forEach(function(d) {
    d.values = +d.values;
  });
  
  var browsers = stack(color.domain().map(function(name) {
    return {
      name: name,
      values: data.map(function(d) {
        return {date: d.date, y: d[name] / 1};
      })
    };
  }));

  var ymin = d3.min(browsers, function(d) { 
	return d3.min(d.values, function(dd) { return dd.y0; }); });
  var ymax = d3.sum(browsers, function(d) { 
	return d3.mean(d.values, function(dd) { return dd.y0; }); });
	
	y.domain([ymin, 6]);
	x.domain(d3.extent(data, function(d) { return d.date; }));
  
  var browser = svg.selectAll(".browser")
      .data(browsers)
    .enter().append("g")
      .attr("class", "browser");

  browser.append("path")
      .attr("class", "area")
      .attr("d", function(d) { return area(d.values); })
      .style("fill", function(d) { return color(d.name); });
	  
	
  browser.append("rect")
	  .datum(function(d) { return {name: d.name, value: d.values[d.values.length - 1]}; })
      .attr("transform", function(d, i) { return "translate(" + (width*1.0125) + "," + ((height*0.06*i)+(height*0.108)) + ")"; })
	  .attr("height", 9)
	  .attr("width", 9)
	  .attr("fill", function(d, i){  return color(d.name); });
	  
  browser.append("text")
      .datum(function(d) { return {name: d.name, value: d.values[d.values.length - 1]}; })
      .attr("transform", function(d, i) { return "translate(" + (width*1.0625) + "," + ((height*0.06*i)+(height*0.12)) + ")"; })
      .attr("dy", ".35em")
      .text(function(d) { return d.name; });

  svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis)
	  .append("text")
				.attr("transform", "translate("+(width/2) + "," + (margin.bottom) + ")")
				.text("Year");

  svg.append("g")
      .attr("class", "y axis")
      .call(yAxis)
	  .append("text")
				.attr("transform", function(d) {return "translate(-" + (margin.left) + "," + ((height/2)-(height*0.08)) + ") rotate(-90)" ; })
				.attr("y", 6)
				.attr("dy", ".71em")
				.style("text-anchor", "end")
				.text("Land (GHa)");
});

	svg.append("text")
		.attr("transform", "translate(" + (width/2) + ", " + (height*-0.04) + ")")
		.attr("text-anchor", "middle")
		.text("Allocation of Land");