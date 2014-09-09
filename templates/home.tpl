<DOCTYPE! HTML>
<head id="top">
	<title>Documentation</title>
	<link rel="stylesheet" href="../static/css/normalize.css">
	<link rel="stylesheet" href="../static/css/main.css">
	<script src="../static/js/vendor/d3.v3.min.js"></script>
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
    <section id="intro">
      <header>
        <h1>Welcome to FABLE!</h1>
      </header>
    </section>
	<section id="intro-text" class="clearfix">
		<!--Input text here-->
		<p>
			Competition for land use over time is projected to increase. Changes in demand for energy,
			forestry products, and food are driven by expected increases in population and changing diets
			over time, especially in the developing world. These issues are compounded by the uncertainty
			of agricultural and forestry productivity due to climate change. As such, research has begun 
			to focus more intensely on the optimal allocation of land across sectors and time. </p>
		<p>	
			FABLE differs from other land use models by integrating components of interest from several
			research communities. It seeks to address the gap between two land use models. The first are
			indirect land use change models (iLUCs) that assess short term costs of substituting biofuel 
			crops in areas of highly productive agriculture, therefore forcing food crops to less productive
			areas or into carbon-rich natural environments. The second are so called integrated assessment
			models (IAMs) that account for significant greenhouse gas reductions by substituting biofuel
			production for conventional energy demands.
		</p>
    </section>
	
	<section id="OoM">
		<h2>Outline of Model<h2>
	</section>
	<section id="OoM-text">
		<p>
			The Forest, Agriculture, and Biofuels in a Land use model with Environmental services (FABLE) is
			a global, intertemporally-consistent optimization model for land use analysis. The model
			incorporates projections of demands for food, energy and bioenergy, timber and recreation or 
			environmental services in addition to greenhouse gas mitigation targets to solve a constrained 
			welfare maximization problem. The model runs over the period 2005 - 2204, and has accurately 
			predicted developments over the existing history. 
		</p>
		<p>
			FABLE takes income, population, wages, oil prices, total factor productivity and other input
			prices as exogenous. The model is solved by maximizing discounted social welfare across 200 years
			of global demand for land associated with crop and pasture demand, as well as energy (via 
			conventional liquid fuels and biofuel substitutes), timber and recreational services. 
		</p>
		<p>
			To learn more please see the <a href="/documentation">Documentation</a> page.
		</p>
	</section>
  </article>
  <article id="graph_content">
	<section>
		<div id="foo">
			<script src="../static/js/Land_Allocation_Baseline_prev.js"></script>
		<div>
		<p>
			Baseline land use allocation results from the FABLE model. 
		</p>
	</section>
  </article>
 </body>