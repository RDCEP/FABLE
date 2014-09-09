FABLE_README.txt

-Folders-

There are two main folders:
	-'templates' contains the html files for the site (though the file type says .tpl the are written in html, this is for compatibility with the server)
	-'static' contain two sub folders:
		-'css' contains the css (page styles) for the website.
		-'js' contains the javascript and graph data (located in the 'FABLE_Graph_Data' folder) as well as the d3 javascript library (located in the 'vendor' folder)

		
-Running the Site-

In order to properly read in data files the site must be hosted on a local server.
For this project I used the "Bottle" development framework to host the site on localhost:8080.
The FABLE.py file in the 'templates' folder starts up the local server to host the site.
After starting the server type "localhost:8080" into the address bar and that should direct you to the homepage.

*Note: The route to the static folder in FABLE.py was specifically set for my computer. 
	   Please adjust it accordingly to load the page's static files (js, and css files).
	   If you have your own means of running a localhost please feel free to do so

	   
-Small Additions/Fixes-

	-Axis along slider tool
	-Number input for pie chart inspect tool for better accuracy and control
	-Add bold zero line to the GHG Emission graph to show where the graph crosses the x-axis
	-Center X-axis tick labels
	-Modify page anchors in "Glossary" and "Documentation" sections (they go a little to low)
*Note: These changes are small in the sense that the site coulddo with or without depending on preference, and might not always be small in the sense of an easy fix.
	   
	   
-Current Bugs-

When using the pie chart slider some of the sections on the chart will switch places while sliding.
This occurs because the pie chart organizes the areas from smallest to largest going counter-clockwise, and as the chart plots further into the data some values may have surpassed other values causing the areas to swap..
I believe this to be the default way in which d3 renders pie charts but I might be wrong, and if this could be fixed that would be great.

Also when using the pie chart slider the year display does not update to the selected year nor does the legend update the data display in the legend.

-What Next-

	-Finalize/finish populating "Home", "Glossary", and "Documentation" sections
	-Design interactive tool for GHG Emissions plot in "FABLE Baseline" tab
	-Optimize current code for better load time, readability, and efficiency
	-Design Interface for "Run FABLE" tab
	-Link site to FABLE model on back-end
	-Launch site!


-Comments-

All javascript code is commented; however, the css and html code is not (as I did not write the large majority of the css, and the html is fairly basic).
Please comment your code so that others may pick up where you left off.

