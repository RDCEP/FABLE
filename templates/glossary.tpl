<DOCTYPE! HTML>
<head id="top">
	<title>Glossary</title>
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
		
		<li><ul id="left_nav">
		<li><h3><b>SECTORS</b></h3>

					<li class="sector_menu"><a href="#land"><b>Resource Use - Land</b></a>
						<ul>
							<li><a href="#protland">Protected Land</a></li>
						</ul>
					</li>
					<li class="sector_menu"><a href="#ffuel"><b>Resource Use - Fossil Fuels</b></a></li>
					<li class="sector_menu"><a href="#agrochem"><b>Agrochemical</b></a>
						<ul>
							<li><a href="#ces-func">CES Function</a></li>
							<li><a href="#imperf-sub">Imperfect Substitution</a></li>
						</ul>
					</li>
					<li class="sector_menu"><a href="#agricul"><b>Agricultural</b></a></li>
					<li class="sector_menu"><a href="#livefarm"><b>Livestock Farming</b></a></li>
					<li class="sector_menu"><a href="#foodpro"><b>Food Processing</b></a></li>
					<li class="sector_menu"><a href="#biofuel"><b>Biofuels</b></a>
						<ul>
							<li><a href="#1g">1st Generation Biofuel</a></li>
							<li><a href="#2g">2n Generation Biofuel</a></li>
						</ul>
					</li>
					<li class="sector_menu"><a href="#energy"><b>Energy</b></a></li>
					<li class="sector_menu"><a href="#forest"><b>Forestry</b></a>
						<ul>
							<li><a href="#vint">Vintage</a></li>
						</ul>
					</li>
					<li class="sector_menu"><a href="#timber"><b>Timber</b></a></li>
					<li class="sector_menu"><a href="#ecoserv"><b>Ecosystem Services</b></a>
						<ul>
							<li><a href=“#eco”>Ecosystem Services</a></li>
						</ul>
					</li>
					<li class="sector_menu"><a href="#other"><b>Other Goods & Services</b></a></li>
					<li class="sector_menu"><a href="#ghg"><b>GHG Emissions</b></a></li>
					<li class="sector_menu"><a href="#pref"><b>Preferences</b></a>
						<ul>
							<li><a href="#util">Utilities</a></li>
							<li><a href="#aidads-mod">AIDADS Model</a></li>
							<li><a href="#marg-budg-shar">Marginal Budget Shares</a></li>
						</ul>
					</li>
					<li class="sector_menu"><a href="#welfare"><b>Welfare</b></a>
						<ul>
							<li><a href="#welf-func">Welfare Function</a></li>
							<li><a href="#scale-invar">Scale Invariant</a></li>
						</ul>
					</li>
				
			</li>
      </ul>
    </nav>
  </header>
  
	
  <article id="main_content">
    <section id="intro">
      <header>
        <h1>Glossary</h1>
      </header>
    </section>

	<section id="sector-text" class="clearfix">

	<h2 id="land">Resource Use - Land</h2><br>
		<p id="protland">
			• <b>Protected Land</b> - natural parks, biodiversity reserves, and other types of protected forests 				used to produce ecosystem services
		</p><br>

	<h2 id="agrochem">Agrochemical</h2><br>
		<p id="ces-func">
			• <b>CES Function</b> - CES refers to constant elasticity of substitution. A CES production function is a model
			of production where two or more goods have a constant elasticity of substitution. This means that the
			ratio of substituting inputs remains constant no matter how much of an input is available.
		</p>
		<p id="imperf-sub">
			• <b>Imperfect Substitutes</b> - two goods are imperfect substitutes if they both are used to produce another
			good or service, and output of this final product is greatest when both inputs are used. That is, one
			input may substitue for the other, but output will be lower because good A is not the same as good
			B. In FABLE, for example, pasture land and animal feed are imperfect substitutes. Livestock can still
			live on pasture with less feed, or with more feed and less pasture, but using both will produce the most
			output.
		</p><br>
	
	<h2 id="biofuel">Biofuels</h2><br>
		<!—Input text here—>
		<p id="1g">
			• <b>1st Generation Biofuel</b> - Fuel from corn or sugarcane ethanol
		</p>
		<p id="2g">
			• <b>2nd Generation Biofuel</b> - Diesel fuels from cellulosic biomass
		</p><br>

	<h2 id="forest">Forestry</h2><br>
		<!—Input text here—>
		<p id="vint">
			• <b>Vintage</b> - cohort of trees of same age
		</p><br>

	<h2 id="ecoserv">Ecosystem Services</h2><br>
		<!—Input text here—>
		<p id=“eco”>
			• <b>Ecosystem Services</b> - economic value of ecosystems based on their continued existence - physical products (e.g., subsistence food and lumber) environmental services (e.g., pollination and nutrition cycling), and non-use goods which are valued purely for their continued existence (e.g., some unobserved biodiversity)
		</p><br>

	<h2 id="pref">Preferences</h2><br>
		<!—Input text here—>
		<p id="util">
			• <b>Utility</b> - utility is a functional representation of preferences; that is, an equation that describes how
			an economic agent likes to order different amounts of goods and services. A higher utility with some
			bundle of goods and services means that the agent prefers that bundle to another that yields lower
			utility.
		</p>
		<p id="aidads-mod">
			• <b>AIDADS Model</b> - An implicitly directively additive demand system. This is a model of utility of
			consumption. For additional information about this model, please refer to the FABLE documentation.
		</p>
		<p id="marg-budg-shar">
			• <b>Marginal Budget Shares</b> - A budget share is the percent of a consumer’s income that goes towards a
			particular good or service. The marginal budget share is the amount of an extra unit of income that
			the consumer choses to spend on additional goods or services to increase their utility.

		</p><br>

	<h2 id="welfare">Welfare</h2><br>
		<!—Input text here—>
		<p id="welf-func">
			• <b>Welfare Function</b> - A welfare function is an equation specifying how a model characterizes economic
			well-being. It incorporates both the utility of goods and services as well as their costs, and aggregates
			this value over all economic agents in the society.
		</p>
		<p id="scale-invar">
			• <b>Scale-Invariant</b> - These are cost functions with constant returns to scale. Per-unit costs remain the
			same, no matter how much of a quantity is used - eg there are no volume discounts.
		</p><br>
    </section>
  </article>
</body>

  </article>