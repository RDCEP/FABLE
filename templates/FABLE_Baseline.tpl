ja<DOCTYPE! HTML>
<head>
	<title>FABLE Baseline</title>
	<link rel="stylesheet" href="../static/css/normalize.css">
	<link rel="stylesheet" href="../static/css/main.css">
	<script src="../static/js/vendor/d3.v3.min.js"></script>
	<script src="../static/js/vendor/d3.slider.js"></script>
<body>
	<header id="main_nav">
    <nav>
      <ul id="top_nav" class="clearfix">
        <li><a href="/">Home</a></li>
		<li class="sub_menu"><a href="">FABLE</a>
			<ul>
				<li><a href="/Baseline_FABLE">Baseline</a></li>
				<li><a href="/Run_FABLE">Run FABLE</a></li>
			</ul>
		</li>
        <li><a href="/documentation">Documentation</a></li>
        <li><a href="/glossary">Glossary</a></li>
	<li><a href="/mbm">Math Behind the Model</a></li>
      </ul>
    </nav>
  </header>
  <article id="home_content">
    <section>
      <header>
        <h1>Baseline Results</h1>
      </header>
    </section>

    <section id="summary" class="clearfix">
		<h2>Allocation of Land</h2><br>
			<div id="land">
				<script src="../static/js/Land_Allocation_Baseline.js"></script>
			</div>
			<div id="inspect">
				<form class="year-select">
					Year: <input id="year" type="range" min="0" max="100" step="1" value="0">
						  <label class="active">2005</label>
				</form>
				<script src="../static/js/Land_Allocation_Breakdown.js"></script>
				
			</div><br>
			<p>
				This graph shows the model output for optimal land use in the baseline scenario. In
				the near term, land dedicated to crops increases. After 2035 cropland decreases due to shifting diets and
				technological improvements, but is offset by land dedicated to animal feed. Pasture land declines over the
				course of the simulation, demonstrating the substitution of animal feed for pasture land. Protected land
				increases substantially over the course of the simulation due to growing weath and corresponding increased
				value of ecosystem services. Finally, growth in the price of energy result in more land being dedicated to
				biofuel production.
			</p><br>
		<h2>Lnad Based Consumption of Goods</h2><br>
			<div id="goods">
				<script src="../static/js/Consumption_of_Goods_Baseline.js"></script>
			</div>
			<div id="inspect-goods">
				<form class="year-select">
					Year: <input id="year-goods" type="range" min="0" max="100" step="1" value="0">
						  <label class="active">2005</label>
				</form>
				<script src="../static/js/Consumption_of_Goods_Breakdown.js"></script>
				
			</div><br>
			<p>
				This graph shows per-capital consumption of the goods and services
				specified in the FABLE model. The consumption of livestock products, timber products, and biofuels grow
				in absolute terms. This growth is driven by changing preferences, decline in population growth, and rising
				energy prices. Here the growth in processed livestock product consumption is the most evident, driving land
				use changes and GHG emissions from the previous two graphs. Declines in the consumption of ecosystem
				services in the first quarter century are driven by decreases due to deforestation, though greater demand
				for recreation and growth in protected forests over the remaining years of the simulation minimize further
				losses.
			</p><br>
		 <h2>Consumption of Biofuels</h2><br>
			<div id="biofuel">
				<script src="../static/js/Consumption_of_Biofuels_Baseline.js"></script>
			</div>
			<div id="inspect-biofuels">
				<form class="year-select">
					Year: <input id="year-biofuels" type="range" min="0" max="100" step="1" value="0">
						  <label class="active">2005</label>
				</form>
				<script src="../static/js/Consumption_of_Biofuels_Breakdown.js"></script>
				
			</div><br>
			<p>
				This graph shows the consumption and share of biofuels in total energy
				consumption. First generation biofuels grow slightly as energy prices and agricultural lands increase, however
				the great majority of both consumption and share are due to the adoption of second generation biofuels.
				The second generation biofuels drive the increase in land allocated to cellulosic feedstock production in
				the second half of the simulation, however expansion of land devoted to animal feed limits higher rates of
				biofuel production and share. Ultimately, share declines even though production continues to expand, due
				to growing total energy requirements.
			</p><br>
		<h2>Land Based GHG Emissions</h2><br>
			<div id="ghg">
				<script src="../static/js/GHG_Emissions_Baseline.js"></script>
			</div>
			<p>
				This graph shows the gross land based greenhouse gas emissions from their
				respective sources in the FABLE model, as well as net accumulation. Positive values indicate sources of GHG
				emissions while negative values indicate abatement. A significant driver of emissions include deforestation in
				the first quarter of the simulation, which itself is caused by the increased demand for food crops shown in the
				previous graph. However, increasing access costs of natural land along with declining demand for commercial
				land results in a decrease in deforestation, reducing emission intensity from this source. Emissions from
				fertilizer use are relatively stable throughout the modeling timeframe, with increases near the end of the
				simulation driven by increased livestock feed requirements. Shifting diets drive this increase in meat and
				dairy demand which simultaneously increases emissions due to enteric fermentation and manure management.
				As land allocated to forests do not change substantially through the simulation, GHG sequestration in this
				sector remain stable. The largest growth in GHG sinks appear due to biofuel substitution for petroleum
				products in the second half of the century, driven by growth in second generation biofuels.
			</p>
			
    </section>
  </article>
 
 
 
 
 
 
 
 </body>