<DOCTYPE! HTML>
<head id="top">
	<title>Documentation</title>
	<link rel="stylesheet" href="../static/css/normalize.css">
	<link rel="stylesheet" href="../static/css/main.css">
	<script src="../static/js/vendor/d3.v3.min.js"></script>
	
	<script type="text/x-mathjax-config">MathJax.Hub.Config({TeX: { equationNumbers: { autoNumber: "AMS" } }});</script>
	<script type="text/x-mathjax-config">MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});</script>

<script type="text/x-mathjax-config">
  //
  //  The document is hidden until MathJax is finished, then
  //   this function runs, making it visible again.
  //
  MathJax.Hub.Queue(function () {
    document.getElementById("hide_page").style.visibility = "";});</script>

	<script type="text/javascript" src="../static/js/vendor/MathJax/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>

</head>
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
		<ul><li class="sector_menu"><a href="#sectors"><b>SECTORS</b></a>
				<ul>	
					<li><a href="#land">Resource Use - Land</a></li>
					<li><a href="#ffuels">Resource Use - Fossil Fuels</a></li>
					<li><a href="#agrochem">Agrochemical</a></li>
					<li><a href="#agricul">Agricultural</a></li>
					<li><a href="#livefarm">Livestock Farming</a></li>
					<li><a href="#foodpro">Food Processing</a></li>
					<li><a href="#biofuel">Biofuels</a></li>
					<li><a href="#energy">Energy</a></li>
					<li><a href="#forest">Forestry</a></li>
					<li><a href="#timber">Timber</a></li>
					<li><a href="#ecoserv">Ecosystem Services</a></li>
					<li><a href="#other">Other Goods & Services</a></li>
					<li><a href="#ghg">GHG Emissions</a></li>
					<li><a href="#pref">Preferences</a></li>
					<li><a href="#welfare">Welfare</a></li>
				</ul>
			</li>
		</ul>	
		<ul><a href="#lim"><b>CONSTRAINTS</b></a></ul>
		<ul><a href="#biblo"><b>RESOURCES</b></a></ul>
		</ul></li>
      </ul>
    </nav>
  </header>
  
	
  <article id="main_content">
    <section id="intro">
      <header>
        <h1>Documentation</h1>
      </header>
    </section>
	<section id="intro-text" class="clearfix">
		<p>
			Basic Documentation text can go here. 
		
		</p>
    </section>
	
	<section id="sectors">
        <h2>SECTORS</h2>
    </section>
	<section id="sector-text" class="clearfix">
		
	<h3 id="land">Resource Use - Land</h3>

		<p>
			Total land endowment ($\bar{L}$) is fixed, and divided between natural forest 			lands ($L^N$) and managed commercial lands ($L^M$). Natural lands include 			natural parks, biodiversity reserves or other protected forests, and used to 			produce ecosystem services. Within natural land, there exists institutionally 			protected land ($L^R$), which can never be turned in to commercial land and 			unmanaged forests ($L^U$). 

			\begin{equation}
			\bar{L} = L_t^N + L_t^M
			\end{equation}

			\begin{equation}
			L_t^N = L_t^U + L_t^R
			\end{equation}

			\begin{equation}
			L_t^M = L_t^C + L_t^P + L_t^F
			\end{equation}

			Unprotected natural land can be either converted to commercial land via 			deforestation or protected land. Due to the time required to regrow forest 			cover, once land is deforested in FABLE it cannot return to natural land 			during the timeframe of the model. There are costs associated with the 				accessing and conversion of land types; either the cost of building 				infrastructure to access newly converted commercial or the cost of creating 			new protected land via passing legislation or creating recreational 				infrastructure. Commercial land is further subdivided in to land allocated to 			crop land ($L^C$), pasture land ($L^P$), and managed forests ($L^F$). 	
		</p>

	<h3 id="ffuels">Resource Use - Fossil Fuels</h3>

		<p>
			Fossil fuels are used by FABLE in two ways: to supply energy ($x^{f,e}$) and to 			produce fertilizers ($x^{f,n}$) for use in the agricultural sector. The cost of 			fossil fuels is exogenous to the model and reflects the costs of extraction, 			transportation, distribution and any emission control policies. Total supply of 			fossil fuels is given by:

			\begin{equation}
			x_t^f = x_t^{f,n} + x_t^{f,e}
			\end{equation}
		</p>

	<h3 id="agrochem">Agrochemical</h3>
		<p>
			The subset of fossil fuels that are used for fertilizer production from the 			previous module get converted here according to a linear production function 			that is only dependent on the rate of conversion ($\theta^n$). The non-energy 			cost of conversion is constant and scale-invariant. 

			\begin{equation}
			x_t^n = \theta^n x_t^{f,n}
			\end{equation}
		</p>
	
<h3 id="agricul">Agricultural</h3>
		<p>
			This module combines land allocated for crop production and fertilizers from 			the previous module to yield agricultural output. Output is either food crops 			(further subset in to food - $x_t^{c, g}$, animal feed - $x_t^{l,g}$, or 1st 			generation biofuels - $x_t^{b,g}$) or cellulosic feed stocks which are 				exclusively used to produce 2nd generation biofuels - $x_t^{b,2}$. 

			\begin{equation}
			x_t^{g,c} = x_t^{c,g} + x_t^{l,g} + x_t^{b,g}
			\end{equation}

			Land and fertilizers are imperfect substitutes in the production of these two 			(food crops or cellulosic crops) agricultural products, and output is 				additionally a function of the agricultural yield index, value share of crop 			land in agricultural production, and parameters proportional to the elasticity 			of substitution of agricultural land for fertilizers. Non-land costs of 			production, such as labor or capital, are predetermined. 

			\begin{equation}
			x_t^{g,i} = \dfrac{\theta^{g,i}_t}{\Pi_t}\left [\alpha^g \left (L_c^{C,i} 			\right )^{\rho_g} + \left (1-\alpha^g \right )\left (x_t^n \right )^{\rho_g}			\right ]^{\dfrac{1}{\rho_g}} , i = b, c
			\end{equation}			

		</p>


	<h3 id="livefarm">Livestock Farming</h3>
		<p>
			Livestock output is a function of pasture land and animal feed, however these 			inputs are imperfect substitutes. Other parameters that impact output are the 			livestock technology index ($\theta_t^l$), value share of pasture land in the 			production of livestock ($\alpha^l$), and a parameter proportional to the 			elasticity of substitution of pasture land for animal feed. Non-land costs of 			production, such as labor or capital, are predetermined. 

			\begin{equation}
			x_t^l = \dfrac{\theta_t^l}{\Pi_t} \left [ \alpha^l \left (L_t^P 				\right )^{\rho_l} + \left (1-\alpha^l \right) \left (\Pi_t x_t^{l,g} 				\right )^{\rho_l} \right ]^{\dfrac{1}{\rho_l}}
			\end{equation}
		</p>

	<h3 id="foodpro">Food Processing</h3>
		<p>
			Food processing takes the output from the agricultural and livestock sectors 			and processes them in to foods consumed ($y_t^g$ and $y_t^l$, respectively) in 			the final demand function. This sector captures efficiency gains through 			technological improvements in food production ($\theta_t^{g,y}$ and $				\theta_t^{l,y}$), lessening the initial crops and livestock required to 			satisfy demand. Costs associated with processing both crops and livestock are 			exogenous and scale-invariant. 

			\begin{equation}
			y_t^g = \theta_t^{g,y} x_t^{c,g}
			\end{equation}
	
			\begin{equation}
			y_t^l = \theta_t^{l,y} x_t^l
			\end{equation}
		</p>


	<h3 id="biofuel">Biofuels</h3>
		<p>
			Food crops not used to satisfy caloric demands are used to produce 1st 				generation biofuels. Production of these biofuels follow linearly from the 			amount of remaining food ($x^{b,g}$) according to a technology index ($				\theta_t^{b,1}$), which varies exogenously over time. 

			\begin{equation}
			x_t^{b,1} = \theta_t^{b,1}x^{b,g}
			\end{equation}

			The sector also converts cellulosic feedstocks in to second generation 				biofuels. Second generation biofuels are expected to grow in market share 			according to an S-shaped function due to rate of adoption and availability and 			cost of capital and technology. The production function of 2nd generation 			biofuels accounts for the declining impact of fixed inputs according to the 			rate of factor-specific technological progress in addition to the agricultural 			yield of cellulosic crops. Other parameters of the production function are  a 			technology factor, the value share of the fixed factor in 2nd generation 			biofuel production, and a parameter related to the elasticity of substitution 			of technology fixed factor for cellulosic feed stocks. Costs associated with 			the production of biofuels are exogenous and scale-invariant. 

			\begin{equation}
			x_t^{b,2} = \theta^{b,2} \left [ \left (\alpha^b \right )^{\theta_t^\phi} 			\left(\phi \right )^{\rho_b} + \left (1-\alpha^b \right ) \left (x_t^{g,b} 			\right )^{\rho_b} \right ]^{\dfrac{1}{\rho^b}}
			\end{equation}

		</p>


	<h3 id="energy">Energy</h3>
		<p>
			The demand for energy is met by first and second generation biofuels in 			addition to fossil fuels. FABLE assumes that second generation biofuels are 			perfect substitutes for fossil fuels, while first generation biofuels must be 			mixed with petroleum products in certain ratios and are therefore imperfect 			substitutes. Other parameters influencing supply include the efficiency of 			energy production, value share of first generation biofuels at the initial 			time, and a parameter proportional to the elasticity of substitution of first 			generation biofuels. 

			\begin{equation}
			y_t^e = \theta_t^e \left ( \alpha^e \left (x_t^{b,1} \right )^{\rho_e} + \left 			(1-\alpha^e \right ) \left (\dfrac{x_t^{f,e}}{\Pi_t} + x_t^{b,2} 				\right )^{\rho_e} \right )^{\dfrac{1}{\rho_e}}
			\end{equation}

			The cost of energy production are simply the sum of the non-land cost of 			fossil fuels and biofuels from the previous sectors.

			\begin{equation}
			c_t^e = \sum \limits_i c^{b,1} + c_t^f , i = 1, 2
			\end{equation}
			
		</p>


	<h3 id="forest">Forestry</h3>
		<p>
			Each hectare of managed forest has an average vintage of tree, which can then 			be either planted, harvested, or left to mature for another period. If the 			area is harvested, a portion of the mass of trees will yield raw timber 			according to a monotonically increasing function where higher vintages have 			higher yields. However, trees cannot be harvested until they reach a minimum 			age, and trees that have fully matured do not grow further and remain at the 			maximum vintage ($v_{max}$) until harvested. Costs for harvesting a ton of 			forest product are scale-invariant and constant across vintages. Since older 			forests have higher yields, however, cost is a decreasing function of output. 			Planting a hectare of forest also has a constant, scale invariant cost.

			\begin{equation}
			L_t^F = \sum \limits_{v=1}^{v_{max}} L_{v,t}^F
			\end{equation}

			\begin{equation}
			L_{v+1, t+1}^F = L_{v,t}^F - \Delta L_{v,t}^{F,H} , v < v_{max} - 1
			\end{equation}

			\begin{equation}
			L_{v_{max}, t+1}^F = L_{v_{max}, t}^F - \Delta L_{v+{max}, t}^{F, H} + 				L_{v_{max}-1, t}^F - \Delta L_{v_{max}-1, t}^{F,H}
			\end{equation}
			
			\begin{equation}
			L_{1, t+1}^F = \Delta L_t^{F,P}
			\end{equation}

			\begin{equation}
			x_t^w = \sum \limits_{v=1}^{v_{max}} \dfrac{\theta_{v,t}^w}{\Pi_t} \Delta 			L_{v,t}^{F,H}
			\end{equation}
		</p>

	<h3 id="timber">Timber</h3>
		<p>
			Timber processing yield is a function of the amount of timber harvested in 			that year and the technology index of timber processing ($\theta_t^{w,y}$), 			which measures efficiency gains and quality improvements. Costs again are 			exogenous and scale-invariant. 

			\begin{equation}
			y_t^w = \theta_t^{w,y} x_t^w
			\end{equation}

		</p>

	<h3 id="ecoserv">Ecosystem Services</h3>
		<p>
			Ecosystem services are difficult to quantify, both because it is hard to 			define what constitute these services and because it is difficult to assign a 			value to many of the services. FABLE calculates the per capita output of 			ecosystem services to be proportional to a CES production function of all the 			natural and managed land types such that managed and natural lands are 				imperfect substitutes for one another. Parameters modifying this relationship 			include the technology index of ecosystem service production, value shares of 			crop, pasture, and managed forest lands in production of ecosystem services, 			and a parameter proportional to the elasticity of substitution of different 			types of land in production of ecosystem services. The cost of producing 			ecosystem services is just the maintenance and infrastructure expenditures per 			hectare of reserved natural land. All other production costs - for 				agricultural, managed forests and unmanaged lands - are zero. All costs in 			this module are exogenous and scale-invariant.  

			\begin{equation}
			y_t^r = \dfrac{\theta^r}{\Pi_t} \left [ \sum \limits_{i= C, P, F} \alpha^{i,r} 			\left (L_t^i \right )^{\rho_r} + \left (1- \sum \limits_{i = C, P, F} 				\alpha^{i, r} \right ) \left (L_t^U + \theta^R L_t^R \right )^{\rho_r} 				\right ] ^{\dfrac{1}{\rho_r}}
			\end{equation}
		</p>
	

	<h3 id="other">Other Good & Services</h3>
		<p>
			In order to complete the demand system which determines welfare, all other 			goods and services aside from agriculture, energy and timber must be accounted 			for. Because these goods are not dependent on the land resources in this model 			we assume their production costs are zero and that production grows 				exogenously. 

		</p>


	<h3 id="ghg">Green House Gas Emissions</h3>
		<p>
			Greenhouse gases come from multiple sources within the FABLE model: <br>
			<ul id="ghg-list">	
				<li>combustion of petroleum products</li>
				<li>conversion of unmanaged and managed forests to agricultural land 				</li>
				<li>non-CO2 emissions from the use of nitrogen fertilizers in 					agricultural products</li>
				<li>non-CO2 emissions from the livestock sector - both enteric 					fermentation and manure management</li>
				<li>net GHG sequestration through forest sinks, including the GHG 				emissions from harvesting forests</li>
			</ul><br>

			FABLE differentiates between emissions resulting from petroleum combustion due 			to the exogenous nature of the price path (which is explained in the Energy 			sector). All other GHG sources are endogenous to the model.
		</p>

		<p>
			Emissions from petroleum combustion, deforestation and fertilizer use are 			linearly proportional to the use of fossil fuels and allocation of commercial 			lands. That is, each ton of oil equivalent of fossil fuel combusted or 				converted to fertilizer, or hectare of land deforested release a predetermined 			amount of $CO_2$-equivalent greenhouse gases. Livestock emissions are the sum 			of emissions per hectare pasture land (from manure left on the land) and 			emissions per ton of livestock produced (from enteric fermentation). 
		</p>
		
		<p>
			Sequestration of GHG from forests is dependent on the vintage of that hectare 			(younger forests sequester carbon at a faster rate), and is limited to managed 			forests since unmanaged forests are mainly older tree vintages with limited 			sequestration potential. Harvesting managed forests release GHG  to a lesser 			extent than total deforestation due to some permanent sequestration in managed 			forests. FABLE ignores annual cycles of GHG sequestration of agricultural 			products as these crops are subsequently harvested and consumed. 
		</p>

		<p>
			Emission control is managed through a quota constraint such that emissions from 			deforestation, fertilizer application and forest sequestration cannot exceed 			the quota. Fossil fuel emission constraints are not included in this quota as 			any such instruments should be managed through the price of the fuels affecting 			demand and welfare. Since biofuels provide a renewable alternative to fossil 			fuels, FABLE credits the emissions quota with the fraction of fossil fuel 			emissions displaced by biofuels. 
		
			\begin{equation}
			z_t = \mu^{f,e} x_t^{f,e} + \mu^{f,n} x_t^{f,n} + z_t^L
			\end{equation}

			\begin{equation}
			z_t^L = \mu^L \Delta L_t^U + \mu^P L_t^P + \mu^n x_t^n + \mu^l x_t^l + (1 - 			\varphi)\sum \limits_{v=1}^{v_{max}} \mu^h_v \Delta L_{v,t}^{F,H} - \sum 			\limits_{v=1}^{v_{max}} \mu_v^w L_{v,t}^F
			\end{equation}

			\begin{equation}
			z_t^L \leq \bar{z_t}^L = \theta_t^z \left ( z_t^L - \left ( 1 - \dfrac{\mu^{b,			1}}{\mu^x} \right ) x_t^{b,i} \right ) , i = 1, 2
			\end{equation}

		</p>


	<h3 id="pref">Preferences</h3>
		<p>
			Preferences, in the form of a utility function, are represented by the AIDADS 			(an implicitly directively additive demand system) model, which was chosen for 			it's flexible treatment of Engel effects, global regularity properties, and its 			superior performance in other studies of food demand (useful for a land-use 			model).
		</p>

	<h3 id="welfare">Welfare</h3>
		<p>
			The goal of the social planner is to maximize welfare, which is the discounted 			net aggregate surplus plus the bequest value of unmanaged and commercial 			forests. This is calculated by integrating the marginal valuation of each 			product and subtracting the costs of accessing or producing each good.
		</p>
    </section>
	


		<section id="lim">
		<h2>Constraints<h3>
	</section>
	<section id="lim-text">
		<p>
			FABLE is a model and as such, has certain constraints in scope and resolution. 			The model is not intended for detailed policymaking or land use allocation, but 			instead seeks an optimal distribution of land use, taking in to account the 			irreversibility of many land use decisions. This model cannot reflect the 			impacts of market failures such as imperfect information or poorly defined 			property rights.
		</p>
	</section>
	


	<section id="biblo">
        <h2>RESOURCES</h2>
    </section>
		<section class="clearfix"><h3><b>Indirect Land Use Change Models</b></h3>
		<ul>
			<li>Al-Riffai, P., Dimaranan, Betina, Laborde, D., 2010. Global Trade and Environmental Impact Study of the EU Biofuels Mandate. International Food Policy Research Institute, Washington DC. <a href="http://environmentportal.in/files/biofuelsreportec.pdf"> link</a></li> 
			<li>Banse, M., van Meijl, H., Tabeau, A., Woltjer, G., 2008. Impact of EU Biofuel Policies on World Agricultural and Food Markets. In Sevilla, Spain.</li>
			<li>Dicks, M.R., Campiche, J., Ugarte, D.T., Hellwinckel, C., Bryant, H.L., Richardson, J.W., 2009. Land use implications of expanding biofuel de- mand. J. Agric. Appl. Econ. 41(2) 435–453.</li>			
			<li>Fabiosa, J.F., Beghin, J.C., Dong, F., Elobeid, J., Tokgoz, S., Yu, T.-H., 2010. Land allocation effects of the global ethanol surge: Predictions from the international FAPRI model. Land Econ. 86(4), 687–706.</li>
			<li>Gurgel, A., Reilly, J.M., Paltsev, S., 2007. Potential land use implications of a global biofuels industry. J. Agric. Food Ind. Organ. 5(2). <a href="http://ideas. repec.org/a/bpj/bjafio/v5y2007i2n9.html"> link</a></li>
			<li>Hertel, T.W., Golub, A.G., Jones, A., O’Hare, M., Plevin, R., Kammen, D., 2010. Global land use and greenhouse gas emissions impacts of US maize ethanol: Estimating market-mediated responses. BioScience 60(3), 223– 231.</li>
			<li>Lotze-Campen, H., Popp, A., Beringer, T., Mu ̈ller, C., Bondeau, A., Rost, S., Lucht, W., 2010. Scenarios of global bioenergy production: The trade-offs between agricultural expansion, intensification and trade. Ecolog. Model.221(18), 2188–2196.</li> 
			<li>Melillo, J.M., Gurgel, A.C., Kicklighter, D.W., Reilly, J.M., Cronin, T.W.,Felzer, B.S., Paltsev, S., Schlosser, C.A., Sokolov, A.P., Wang, X., 2009. Unintended Environmental Consequences of a Global Biofuels Program. MIT Joint Program on the Science and Policy of Global Change.</li>
		</ul>
		</section>

		<section class="clearfix"><h3><b>Integrated Assessment Models and Comparisons</b></h3>
		<ul>
			<li>Rose, S.K., Ahammad, H., Eickhout, B., Fisher, B., Kurosawa, A., Rao, S., Riahi, K., van Vuuren, D.P., 2012. Land-based mitigation in climate stabilization. Energy Econ. 34(1), 365–380. doi:10.1016/j.eneco.2011.06.004.</li>
			<li>Creutzig, F., Popp, A., Plevin, R., Luderer, G., Minx, J., Edenhofer, O., 2012. Reconciling Top-down and Bottom-up Modelling on Future Bioenergy De- ployment. Nat. Clim. Change 2(5), 320–327.</li>
		</ul>
		
<br>
			<p>Read the original paper <a href="https://www.gtap.agecon.purdue.edu/resources/res_display.asp?RecordID=3988">here.</a></p>

    </section>
		<section class="clearfix"><h3><b>Data Sources</b></h3>
		<u1>
			<li>Global Trade Analysis Project v7 for <a href="https://www.gtap.agecon.purdue.edu/databases/v7/">model parameters</a></li>
			<li>UN Department of Economic and Social Affairs Population Division's 2012 Demographic <a href="http://esa.un.org/unpd/wpp/index.htm">Projections</a></li>
			<li>US Energy Information Administration Annual Energy <a href="http://ntl.bts.gov/lib/34000/34000/34012/0383_2010_.pdf">Outlook</a></li>
			<li>UN Food and Agriculture Organization Statistics <a href="http://faostat3.fao.org/faostat-gateway/go/to/home/E">Database</a></li>
			<li>USDA Foreign Agricultural Service Production, Supply, and Demand <a href="http://apps.fas.usda.gov/psdonline/">Database</a></li>
			<li>US Energy Information Administration International Energy <a href="http://www.eia.gov/forecasts/archive/ieo10/index.html">Outlook</a></li>
			


  </article>
</body>









