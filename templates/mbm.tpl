<DOCTYPE! HTML>
<head id="top">
	<title>Math Behind the Model</title>
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
					<li class="sector_menu"><a href="#land"><b>Land Use</b></a></li>
					<li class="sector_menu"><a href="#fossil"><b>Fossil Fuels</b></a></li>
					<li class="sector_menu"><a href="#agrochem"><b>Agrochemical</b></a></li>
					<li class="sector_menu"><a href="#agricul"><b>Agricultural</b></a></li>
					<li class="sector_menu"><a href="#livefarm"><b>Livestock Farming</b></a></li>
					<li class="sector_menu"><a href="#foodpro"><b>Food Processing</b></a></li>
					<li class="sector_menu"><a href="#biofuel"><b>Biofuels</b></a></li>
					<li class="sector_menu"><a href="#energy"><b>Energy</b></a></li>
					<li class="sector_menu"><a href="#forest"><b>Forestry</b></a></li>
					<li class="sector_menu"><a href="#timber"><b>Timber</b></a></li>
					<li class="sector_menu"><a href="#ecoserv"><b>Ecosystem Services</b></a></li>
					<li class="sector_menu"><a href="#other"><b>Other Goods & Services</b></a></li>
					<li class="sector_menu"><a href="#ghg"><b>GHG Emissions</b></a></li>
					<li class="sector_menu"><a href="#pref"><b>Preferences</b></a></li>
					<li class="sector_menu"><a href="#welfare"><b>Welfare</b></a></li>
				
			</li>
      </ul>
    </nav>
  </header>
  
	
  <article id="main_content">
    <section id="intro">
      <header>
        <h1>FABLE Equations</h1>
      </header>
    </section>
	<section id="intro-text" class="clearfix">
		<p>
			Below are the equations used to model FABLE. For information about variable identification, equation logic, or sources, please refer to the original <a href="https://www.gtap.agecon.purdue.edu/resources/res_display.asp?RecordID=3988">FABLE Documentation.</a>
		</p>
    </section>
	<section id="sector-text" class="clearfix">
		<p id = "land"><b>Land Use</b>

			\begin{equation}
			\bar{L} = L_t^N + L_t^M
			\end{equation}

			\begin{equation}
			L_t^N = L_t^U + L_t^R
			\end{equation}

			\begin{equation}
			L_{t+1}^U = L_t^U - \Delta L_t^U - \Delta L_t^R, L_0^U > 0
			\end{equation}

			\begin{equation}
			L_{t+1}^R = L_t^R + \Delta L_t^R ,L_0^R > 0
			\end{equation}

			\begin{equation}
			c_{t+1}^U = c_t^u - \zeta_1^u ln\left (\dfrac{L_{t+1}^N}{L_0^N} \right ) + \zeta_2^u \left 				( \dfrac{\Delta L_t^U + \Delta L_t^R}{L_t^N} \right )^2
			\end{equation}

			\begin{equation}
			c_t^R = \zeta_)^R + \zeta_1^R \Delta L_t^R
			\end{equation}

			\begin{equation}
			L_t^M = L_t^C + L_t^P + L_t^F
			\end{equation}

			\begin{equation}
			L_{t+1}^M = L_t^M + \Delta L_t^U, L_0^M > 0
			\end{equation}
		</p><br>
		
		<p id="fossil"><b>Fossil Fuels</b>

			\begin{equation}
			x_t^f = x_t^{f,n} + x_t^{f,e}
			\end{equation}
		
			\begin{equation}
			c_t^f = \dfrac{c_T^f c_0^f e^{\kappa_f t}}{c_t^f + c_0^f (e^{\kappa_f t - 1)}}, c_0^f > 0
			\end{equation}
		</p><br>

		<p id="agrochem"><b>Agrochemical Sector</b>

			\begin{equation}
			x_t^n = \theta^n x_t^{f,n}
			\end{equation}

		</p><br>
		<p id="agricul"><b>Agricultural Sector</b>

			\begin{equation}
			x_t^{g,c} = x_t^{c,g} + x_t^{l,g} + x_t^{b,g}
			\end{equation}

			\begin{equation}
			x+t^{g,i} = \dfrac{\theta_t^{g,i}}{\Pi_t}\left [\alpha^g \left (L_t^{C,i} \right)^{\rho_g} + \left (1-			\alpha^g \right ) \left (x_t^n \right )^{\rho^g} \right ]^{1/\rho^g}, i= b,c
			\end{equation}

			\begin{equation}
			L_t^{C,i} = \dfrac{x_t^{g,i}}{\theta_t^{g,i}}\left (\dfrac{\alpha^g}{c_t^{C,i}} \right )^{\sigma_g} 			\left (\alpha^g \left (c_t^{C,i} \right )^{1-\sigma_g} + \left (1-\alpha^g \right )^{\sigma_g} \left 			(c_t^f \right )^{1-\sigma_g} \right ) ^{1/1-\sigma_g}
			\end{equation}

			\begin{equation}
			c_t^{g,i} = \dfrac{1}{\theta_t^{g,i}}\left (\left (\alpha^g \right )^{\sigma_g} \left (c_t^{C,i} 			\right )^{1-\sigma_{g,i}} + \left(1-\alpha^g\right )^{\sigma_g} \left (c_t^f\right)^{1-\sigma_g} 			\right )^{1/1-\sigma_g}
			\end{equation}

			\begin{equation}
			\theta_g^{g,c} = \dfrac{\theta_T^{g,c}\theta_0^{g,c} e^{\kappa_{g,c}t}}{\theta_TT{g,c} + \theta_0 			(e^{\kappa_{g,c} t} - 1}
			\end{equation}

			\begin{equation}
			\theta_{t+1}^{g,b} = \theta_t^{g,b} + \kappa_{g,b}, \theta_0^{g,b} > 0
			\end{equation}

		</p><br>
		<p id="livefarm"><b>Livestock Farming Sector</b>

			\begin{equation}
			x_t^l = \dfrac{\theta_t^l}{\Pi_t}\left [\alpha^l \left (L_t^P \right )^{\rho_l} + \left (1-\alpha^l 			\right )\left(\Pi_t x_t^{l,g} \right )^{\rho_l} \right]^{1/\rho_l}
			\end{equation}

			\begin{equation}
			c_t^l = c_0^l x_t^l + \zeta_0^l \left (\Delta L_t^P \right )^2
			\end{equation}

		</p><br>
		<p id="foodpro"><b>Food Processing Sector</b>

			\begin{equation}
			y_t^g = \theta_t^{g,y} x_t^{c,g}
			\end{equation}

			\begin{equation}
			y_t^l = \theta_t^{l,y} x_t^l
			\end{equation}

			\begin{equation}
			\theta_{t+1}^{i,y} = \kappa_{i,y}\theta_t^{i,y}, \theta_0^{i,y} > 0, i=g,l
			\end{equation}

		</p><br>
		<p id="biofuel"><b>Biofuels Sector</b>

			\begin{equation}
			x_t^{b,1} = \theta_t^{b,1} x^{b,g}
			\end{equation}

			\begin{equation}
			x_t^{b,2} = \theta^{b,2} \left [\left (\alpha^b \right ) ^{\theta_t^{\phi}} \left (\phi 				\right )^{\rho_b} + \left (1-\alpha^b \right )\left (x_t^{g,b}\right) ^{\rho_b} \right ] ^{1/\rho_b}
			\end{equation}

			\begin{equation}
			\theta_{t+1}^\phi = \kappa_\phi \theta_t^{\phi} , \theta_0^\phi >0
			\end{equation}


		</p><br>
		<p id="energy"><b>Energy Sector</b>

			\begin{equation}
			y_t^e = \theta_t^e \left (\alpha^e \left ( x_t^{b,1} \right )^{\rho_e} + \left (1-\alpha^e \right) 			\left (\dfrac{x_t^{f,e}}{\Pi_t} + x_t^{b,2}\right )^{\rho_e} \right )^{1/\rho_e}
			\end{equation}

			\begin{equation}
			theta^e_{t+1} = \kappa_e\theta_t^e , theta_0^e>0
			\end{equation}

			\begin{equation}
			c_t^e = \sum \limits_i c^{b,i} + c_t^f, i=1,2
			\end{equation}

		</p><br>
		<p id="forest"><b>Forestry Sector</b>

			\begin{equation}
			L_t^F = \sum \limits_{v=1}^{v_{max}} L_{v,t}^F
			\end{equation}

			\begin{equation}
			L_{v+1, t+1}^F = L_{v,t}^F - \Delta L_{v,t}^{F,H} , v < v_{max} - 1
			\end{equation}

			\begin{equation}
			L_{v_{max}, t+1}^F = L_{v_{max},t}^F - \Delta L_{v_{max},t}^{F,H} + L_{v_{max} -1,t}^F - \Delta 			L_{v_{max}-1, t}^{F,H}
			\end{equation}

			\begin{equation}
			L_{1, t+1}^F = \Delta L_t^{F,P}
			\end{equation}

			\begin{equation}
			x_t^w = \sum \limits_{v=1}^{v_{max}} \dfrac{\theta_{v,t}^w}{\Pi_t} \Delta L_{v,t}^{F,H}
			\end{equation}

			\begin{equation}
			\theta_{v,t+1}^w = \theta_{v,t}^w + \kappa_v^w , \theta_{v,0}^w > 0
			\end{equation}

			\begin{equation}
			c_t^w = \zeta_0^w \sum_v \theta_{v,0}^w \Delta L_{v,t}^{F,H} + \zeta_1^w \left [\sum_v \left ( \Delta 			L_{v,t}^{F,H} - \Delta L_{v,t-1}^{F,H} \right ) \right]^2 + \zeta_2^w \left (\sum_v \Delta L_{v,t}			^{F,H} - \Delta L_t^{F,P}\right )^2
			\end{equation}

		</p><br>
		<p id="timber"><b>Timber Processing Sector</b>

			\begin{equation}
			y_t^w = \theta_t^{w,y} x_t^w
			\end{equation}

			\begin{equation}
			\theta_{t+1}^{w,y} = \kappa_{w,y}\theta^{w,y}_t , \theta_0^{w,y} > 0
			\end{equation}

		</p><br>
		<p id="ecoserv"><b>Ecosystem Services Sector</b>

			\begin{equation}
			y_t^r = \dfrac{\theta^r}{\Pi_t} \left [\sum \limits_{i=C,P,F} \alpha^{i,r} \left(L_t^i\right)^{\rho_r} 			+ \left (1-\sum\limits_{i=C,P,F} \alpha^{i,r} \right ) \left (L_t^U + \theta^R L_t^R\right )^{\rho_r}			\right]^{1/\rho_r}
			\end{equation}

			\begin{equation}
			c_t^R = \dfrac{c_0^R}{(1 + \kappa_R)^t}, c_0^R > 0
			\end{equation}

		</p><br>
		<p id="other"><b>Other Goods and Services Sector</b>

			\begin{equation}
			\theta_{t+1}^o = \kappa_o \theta_t^o , \theta_0^o > 0
			\end{equation}

		</p><br>
		<p id="ghg"><b>Greenhouse Gas Emissions Sector</b>

			\begin{equation}
			z_t = \mu^{f,e}x_t^{f,e} + \mu^{f,n}x_t^{f,n} + z_t^L
			\end{equation}

			\begin{equation}
			z_t^L = \mu^L \Delta_t^U + \mu^P L_t^P + \mu^n x_t^n + \mu^l x_t^l + (1-\varphi)\sum\limits_{v=1}			^{v_{max}} \mu_v^h \Delta L_{v,t}^{F,H} - \sum\limits_{v-1}^{v-{max}} \mu_v^w L_{v,t}^F
			\end{equation}

			\begin{equation}
			z_t^L \leq \bar{z_t^L} = \theta_t^z \left (z_t^L - \left (1 - \dfrac{\mu^{b,i}}{\mu^x}\right ) 				x_t^{b,i} \right ), i=1,2
			\end{equation}

		</p><br>
		<p id="pref"><b>Preferences</b>

			\begin{equation}
			p_q(q) = \dfrac{\alpha_q + \beta_q exp(u)}{1 + exp(u)}\dfrac{y - \sum_q p_qy^q}{y^q - \underline{y^q}} 			0\leq \alpha_q ,\beta_q \leq 1
			\end{equation}

			\begin{equation}
			F(y^q, u) = \dfrac{\alpha_q + \beta_q exp(u)}{1 + exp(u)} ln\left (\dfrac{y^q - \underline{y^q}}{A 			exp(u)}\right ) 0 \leq \underline{q} < q
			\end{equation}

		</p><br>
		<p id="welfare"><b>Welfare</b>

			\begin{align}
			\underset{g,l,e,w,r}{\text{max}} \sum\limits_{t=0}^{T-1} \delta^t \left [ \begin{array}{ll}
			& \sum\limits_{q=g,l,e,w,r,o} \int_0^{y^q*} (p_q(y^q) - c_q(y^q))dy^q \\
			& - c_t^U(\Delta L_t^U + \Delta L_t^R)  - c_t^R \Delta L_t^R -c^n x_t^n - \\
			& \sum_i c^{g,i} x^{g,i}_t - c^l - c^P \Delta L_t^{F,P} - c_t^w \end{array} \right ] + \delta^T \Gamma 			(L_T^U, L_T^F)
			\end{align}

		</p><br>

    </section>
  </article>
</body>

  </article>