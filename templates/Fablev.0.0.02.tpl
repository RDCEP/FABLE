<DOCTYPE! HTML>
<head>
	<title>FABLE v.0.0.01</title>
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
  <li><ul id="left_nav">
	<b>SECTORS</b>
	<ul id="SECTOR_nav">
		<li><span onClick="document.all.menu1.style.display='block'" ondblclick="document.all.menu1.style.display='none'">
			Agrochemical </span>
			<span id="menu1" ><form id="agrochem">
				Foo 1: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 2: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 3: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 4: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 5: <input type="number" name="Foo" class="param" value=0> (units)<br>
			</form></span></li>
		<li><span onClick="document.all.menu2.style.display='block'" ondblclick="document.all.menu2.style.display='none'">
			Agricultural</span><br>
			<span id="menu2" ><form id="agricul">
				Foo 1: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 2: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 3: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 4: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 5: <input type="number" name="Foo" class="param" value=0> (units)<br>
			</form></span></li>
			<li><span onClick="document.all.menu3.style.display='block'" ondblclick="document.all.menu3.style.display='none'">
			Livestock Farming</span><br>
			<span id="menu3" ><form id="livefarm">
				Foo 1: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 2: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 3: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 4: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 5: <input type="number" name="Foo" class="param" value=0> (units)<br>
			</form></span></li>
			<li><span onClick="document.all.menu4.style.display='block'" ondblclick="document.all.menu4.style.display='none'">
			Food Processing</span><br>
			<span id="menu4" ><form id="foodpro">
				Foo 1: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 2: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 3: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 4: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 5: <input type="number" name="Foo" class="param" value=0> (units)<br>
			<li><span onClick="document.all.menu5.style.display='block'" ondblclick="document.all.menu5.style.display='none'">
			Biofuels</span><br>
			<span id="menu5" ><form id="biofuel">
				Foo 1: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 2: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 3: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 4: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 5: <input type="number" name="Foo" class="param" value=0> (units)<br>
			<li><span onClick="document.all.menu6.style.display='block'" ondblclick="document.all.menu6.style.display='none'">
			Energy</span><br>
			<span id="menu6" ><form id="energy">
				Foo 1: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 2: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 3: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 4: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 5: <input type="number" name="Foo" class="param" value=0> (units)<br>
			</form></span></li>
			<li><span onClick="document.all.menu7.style.display='block'" ondblclick="document.all.menu7.style.display='none'">
			Forestry</span><br>
			<span id="menu7" ><form id="forest">
				Foo 1: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 2: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 3: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 4: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 5: <input type="number" name="Foo" class="param" value=0> (units)<br>
			</form></span></li>
			<li><span onClick="document.all.menu8.style.display='block'" ondblclick="document.all.menu8.style.display='none'">
			Timber</span><br>
			<span id="menu8" ><form id="timber">
				Foo 1: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 2: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 3: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 4: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 5: <input type="number" name="Foo" class="param" value=0> (units)<br>
			</form></span></li>
			<li><span onClick="document.all.menu9.style.display='block'" ondblclick="document.all.menu9.style.display='none'">
			Ecosystem Services</span><br>
			<span id="menu9" ><form id="ecoserv">
				Foo 1: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 2: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 3: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 4: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 5: <input type="number" name="Foo" class="param" value=0> (units)<br>
			</form></span></li>
			<li><span onClick="document.all.menu0.style.display='block'" ondblclick="document.all.menu0.style.display='none'">
			Other</span><br>
			<span id="menu0" ><form id="other">
				Foo 1: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 2: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 3: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 4: <input type="number" name="Foo" class="param" value=0> (units)<br>
				Foo 5: <input type="number" name="Foo" class="param" value=0> (units)<br>
			</form></span></li>
		</ul></li>
		</ul></li>
	</ul>
  <article id="main_content">
    <section>
      <header>
        <h1>Run FABLE</h1>
      </header>
    </section>

    <section id="summary" class="clearfix">

      <div id="land">
		
		Year: <input id="year" type="range" min="0" max="100" step="1" orient="vertical:true" value="0">
		<label class="active">2005</label>
		<script src="../static/js/pieChart.js"></script>
		
		
		
		<!--<script src="../static/js/Land_Allocation_Baseline.js"></script>
		<!-- <script src="../static/js/scatterPlot.js"></script>>
		<!--<script src="../static/js/lineGraph.js"></script>-->
	  </div>

    </section>
  </article>
</body>