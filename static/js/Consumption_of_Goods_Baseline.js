(function(){
var margin = {top: 20, right: 150, bottom: 30, left: 60},
    width = 600 - margin.left - margin.right,
    height = 300 - margin.top - margin.bottom;

//instantiate x & y scales
var x = d3.scale.linear()
    .range([0, width]);
var y = d3.scale.linear()
    .range([height, 0]);

//instantiate colors for area under the curve
var color = d3.scale.category20();

//instantiate x & y axes
var xAxis = d3.svg.axis()
    .scale(x)
	.tickFormat(d3.format(""))
    .orient("bottom");
var yAxis = d3.svg.axis()
    .scale(y)
	.ticks(6)
    .orient("left");
	
//instantiate area object for area under curve
var area = d3.svg.area()
    .x(function(d) { return x(d.date); })
    .y0(function(d) { return y(d.y0); })
    .y1(function(d) { return y(d.y0 + d.y); });

//instantiates stack object to stack the areas
var stack = d3.layout.stack()
    .values(function(d) { return d.values; });

//instantiates SVG element (area were the graph will appear)
var svg = d3.select("#goods").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
	
//reads in CSV containing data
d3.csv("static/js/FABLE_Graph_Data/Consumption_Goods_Base.csv", function(error, data) {
	
  //creates color for each column title exculding the first column (named "date")
  color.domain(d3.keys(data[0]).filter(function(key) { return key !== "date"; }));

  //casts all values to integers (values are initially treated as string upon being read from CSV)
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
  
  //determines minimum and maximum values of the data to later determine domain and range
  //(might not always work and might have to manually input ymin and ymax values)
  var ymin = d3.min(browsers, function(d) { 
	return d3.min(d.values, function(dd) { return dd.y0; }); });
  var ymax = d3.sum(browsers, function(d) { 
	return d3.max(d.values, function(dd) { return dd.y0; }); });
	
	//sets domain and range of the graph
	y.domain([ymin, ymax]);
	x.domain(d3.extent(data, function(d) { return d.date; }));
	
  //draws gridlines
  svg.selectAll("line.horizontalGrid")
			.data(y.ticks(10))
			.enter()
				.append("line")
				.attr(
				{
					"class":"horizontalGrid",
					"x1" : 0,
					"x2" : width,
					"y1" : function(d){ return y(d);},
					"y2" : function(d){ return y(d);},
					"fill" : "none",
					"stroke" : "black",
					"stroke-width" : "0.71px"
				});
				
  //graphs data
  var browser = svg.selectAll(".browser")
      .data(browsers)
      .enter().append("g")
		.attr("class", "browser");
  
  browser.append("path")
      .attr("class", "area")
      .attr("d", function(d) { return area(d.values); })
      .style("fill", function(d, i) { return color(d.name); }); 
  
  //draws legend  
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
  
  //draws x & y axes
  svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis)
	  .append("text")
				.attr("transform", "translate("+(width/2) + "," + (margin.bottom) + ")")
				.attr("text-anchor", "middle")
				.text("Year");

  svg.append("g")
      .attr("class", "y axis")
      .call(yAxis)
	  .append("text")
				.attr("transform", function(d) {return "translate(-" + (margin.left) + "," + ((height/2)-(height*0.08)) + ") rotate(-90)" ; })
				.attr("y", 6)
				.attr("dy", ".71em")
				.style("text-anchor", "middle")
				.text("Consumption (USD/Cap)");
});
  //draws title
	svg.append("text")
		.attr("transform", "translate(" + (width/2) + ", " + (height*-0.04) + ")")
		.attr("text-anchor", "middle")
		.text("Consumption of Goods and Services");
})();	