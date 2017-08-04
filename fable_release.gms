** Model Version November 5th, 2015
** 1 Region (World)
** Perfect Foresight over 200 Years
** 100 Forest Vintages with Replantfing
** AIDADS Utility Function
** Linear and CES Production Functions
** Population, Exponential TFP Growth, Linear Yield Growth
** 9 Sectors incl. livestock
** Terminal Conditions
** Base Year 2004

** Jevgenijs Steinbuks and Thomas W. Hertel (c)
** When using this code please cite the following papers:
** T. Hertel, J. Steinbuks, and W. Tyner. “What is the Social Value of Second Generation Biofuels?”
** Applied Economic Perspectives and Policy, doi: 10.1093/aepp/ppv027
** J. Steinbuks and T. Hertel. “Confronting the Food-Energy-Environment Trilemma:
** Global Land Use in the Long Run”, Environmental and Resource Economics, doi:10.?1007/?s10640-014-9848-y

* Define sets

SETS

t time periods /1*201/
t0(t) First period
tT(t)  Last period
not0(t) Any but first period
notT(t) Any but last period
m(t) Any but first or last period
v forest vintages /1*100/
v0(v) First vintage
vV(v) Oldest vintage
notV(v) Oldest vintage
d(t) periods not reported /101*201/;

t0(t) = yes$(ord(t) EQ 1);
tT(t)  = yes$(ord(t) EQ card(t));
not0(t) = yes$(ord(t) GT 1);
notT(t) = yes$(ord(t) LT card(t));
m(t) = not (t0(t) + tT(t));
v0(v) = yes$(ord(v) EQ 1);
vV(v)  = yes$(ord(v) EQ card(v));
notV(v)  = yes$(ord(v) LT card(v));
alias(t,t1);


* Parameters

SCALARS

* Population

POP0  Population in time 0 in Billion People /6.39/
POPT Population in time T in Billion People /10.1/
POPGR1 Logistic Population Growth Rate  /0.042/


* LAND USE

TLAND0 Total Gross Land in GHa
ALAND0 Area of Agricultural Land in Period 1 in GHa /1.533/
LLAND0 Area of Livestock Land in Period 1 in GHa /2.729/
FLAND0 Area of Commercial Forest Land in period 0 in GHa /1.62/
NLAND0 Area of Natural Land in Period 1 in GHa /2.47/
PLAND0  Amount of Protected Land in Period in GHa  /0.207/
CLAND0 Area of Natural Land Converted in Period 1 in GHa  /0.013/
CPLAND0 Area of Natural Land Protected in Period 1 in GHa /0/
CLALPHA Natural Land Conversion Cost Function Parameter /  0.264 /
CLGAMMA Natural Land Conversion Cost Function Parameter /  105000 /
CLANDC0 Initial Land Convesion Cost in USD'1000 per Ha / - 0.357 /

* Fossil Fuels

FOSPGR   Logistic Oil Price Growth Rate / 0.045 /
FOSSILQ0 Oil and Gas Consumption in Period 0 in Gtoe
FOSSILF0 Oil and Gas Converted to Fertilizers in Period 0 in Gtoe
FOSSILE0 Oil and Gas Combusted in Period 0 in Gtoe  / 4.21 /
FOSSILP0 Fossil Fuel Price in Time 0 in USD'1000 per toe /0.242/
FOSSILPT Fossil Fuels Price at time T /1.84/

* Agrichemical Sector

FERTILC  Non-Energy Fertilizer costs in USD'1000 per ton / - 0.137/
FERTIL0  Fertilizers' Consumption at time 0 in Gton /0.937/
FERTPROD Fertilizer's Conversion rate in ton per toe /1.071/

* Agricultural Sector

YIELD0 Agricultural Yield of Commercial Land in tons per Ha in time 0 /11.79/
YIELDT Potential Ag. Yield
YIELDGR Logistic Yield Growth /0.025/
YIELDM0 Cellulosic Feedstocks Yield of Commercial Land in tons per Ha in time 0 /21.4/
AGPRODC Ag. Product Production Cost in USD'1000 per ton / 0.118 /
AGPRODCM Cellulosic Feedstocks Production Cost in USD'1000 per ton / 0.161 /
APRICE Market Price of Processed foood in USD'1000 per ton /0.473/
FTSIGMA Elasticity of Substitution between Land and Fertilizers / 1.14 /
FTALPHA Share of Commercial Land in CES function /0.55/
FTRHO  CES Transformation Parameter for Land and Fertilizers

* Livestock Sector

LSIGMA Elasticity of Substitution between Pasture Land and Feed /0.75/
LRHO   CES Transformation Parameter for Pasture Land and Feed
LALPHA Share of Pasture Land in CES function /0.35/
LPROD0 Technology of Livestock Production /0.69/
LPRODC Non Land Costs of Livestock Farming /-0.21/
LPRICE Price of Processed Livestock 1000'USD per ton /1.79/
LADJ Adjustment Costs of Pasture Land Conversion /-300/

* Food Processing Sector

FDPRODGR Food Productivity Growth Rate Per Annum
FDPROD0 Food Productivity in tons of food per ton of ag. prod. in time 0  /1.5/
FDPRODC Food Processing Cost in USD'1000 per ton of ag. prod. / - 0.081/
LPROD1 Technology of Livestock Processing /1.7/
LPRODGR Processed Livestock Technology Growth p.a.
LPRODC1 Non Land Costs of Livestock Processing /-0.27/

* Biofuels Sector

BIOF0 Biofuels Consumption in Period 1 in GToe /0.04095/
BIOFPROD Biofuels' Conversion Rate in toe per ton of Ag. Product / 0.283 /
BIOFPRODM 2nd Gen. Biofuels' Conversion Rate in toe per ton of Ag. Product / 0.467 /
BIOFC Biofuels' Conversion Cost in USD'1000 per ton / - 0.442 /
BIOFCM 2nd Gen. Biofuels' Conversion Cost in USD'1000 per ton / - 0.577 /
BMRHO CES Transformation Parameter for Fixed Factor and Cellulosic Feedstocks Crops
BMSIGMA Elasticity of Substitution between Fixed Factor and Cellulosic Feedstocks Crops /0.4/
BMALPHA Share of Cellulosic Feedstocks Crops in CES Function /0.6/
FIXEDFGR Technological Progress affecting Fixed Factor

* Forestry Sector

FORESTCC Forest Non-Land Cost in USD'1000 per ton /- 0.019 /
FOPRODNL Productivity of Otrher Factors in Forestry /2.69/
FORESTP Forest Stumpage price in USD'1000 per ton  /0.067 /
REPLANTC Forest Regeneration Cost in USD'1000 per Ha /-0.036 /
FORYA Forest Vintage Yield Parameter a
FORYB Forest Vintage Yield Parameter b /75/
FORYC Forest Vintage Yield Parameter c /11/
FOPRODGRV Yield Growth of Forest Vintage V in Commercial Forestry Per Annum
HARADJ Adjustment Costs of Forest Conversion Parameter /-300/
HARADJ1 Adjustment Costs of Harvesting Parameter /-150000/
CARBON Forest Carbon per Ha /340/

* Timber Processing Sector

TPRODGR Timber Productivity Growth Rate Per Annum
TPROD0 Timber Productivity (Tons of Timb. Prod. per Ton of Timb.) in time 0 /15.2/
TPRODC Timber Processing Costs in USD'1000 per ton / - 1.74/

* Energy Sector

BFSIGMA Elasticity of Substitution between Fossil Fuels and Biofuels / 2 /
BFRHO CES Transformation Parameter for Fossil Fuels and Biofuels
BFALPHA Share of Biofuels in CES Function / 0.09 /
BFGAMMA CES Total Factor Productivity of Energy Production / 1.195 /
ENEFFGR Energy Efficiency Growth Rate per Annum /0.016/

* Ecosystem Services Sector

RECGAMMA CES Parameter for production of ecosystem services / 0.71 /
RECPRODGR Productivity Growth of Recreation Sector
RECCOST Cost of Producting Recreation Services in USD'1000 per Ha / - 0.175 /
RECADMCOST Administrative Cost of Protecting Land Parameter 1 /-3/
RECADMCOST1 Adjustment Cost of Protecting Land Parameter 1 /-300/
RECALPHA Share of Cropland in Ecosystem services /0.02/
RECALPHA1 Share of Pasture Land in Ecosystem Services /0.14/
RECALPHA2 Share of Commercial Forest Land in Ecosystem Services /0.26/
RECALPHA3 Share of Natural & Protected Land in Ecosystem Services
RECSIGMA Elasticity of Substitution between Ecosystem Services /1.1/
RECPLANDP Productivity of Protected Land Relative to Natural Land /10/
RECRHO CES Parameter for Ecosystem Services

* Other Goods and Services

OTHER0 Output of other G&S per capita in time 0 in USD'10000 /0.95/
TFPGR TFP Growth Rate Per Annum / 0.0225 /

* GHG Emissions

ALANDC GHG Emissions from Crop Land in tCO2e per Ha / 0.908 /
NLANDC GHG Emissions from Natural Land Conversion in tCO2e per Ha /515/
FERTLC GHG Emissions from Fertlizers Application in tCO2 per ton /2.843/
FERTC GHG Emissions from Fertlizers Production in tCO2 per ton /1.223/
BIOFCC GHG Emissions from Production of Biofuels
BIOFCRED Biofuels Credits for Fossil Fuel Replacement
BIOFCRED2 2nd Gen. Biofuels Credits for Fossil Fuel Replacement
FOSSILC GHG Emissions from Petroleum Combustion in tCO2e per Toe / 2.902 /
FOSSILC0 Emissions from Petroleum' Combustion in Period 1 in GtCO2e
LANDUSEC0 Emissions from Change in Lands Use in Period 1 in GtCO2e / 5.629 /
TARGR Logistic Reduction in Land-Use Emissions Target /0.03/
GHGFL0 GHG Emissions' Flow in Period 1 in GtCO2e
GHGFLT GHG Emissions' Flow in Period T in GtCO2e
STOCKDEN Forest Carbon Stocking Density MgC per M3 /1.1/
LONGFST Share of Harvested Forest Carbon Retained in Long Run /0.3/
LLANDC GHG Emissions from Pasture Land in tCO2e per Ha  / 0.208 /
LLANDC1 GHG Emissions per ton of livestock /4.641/
LANDUSEC01 Emissions from Lands Use Net of Livestock in Period 1 in GtCO2e
LANDUSECT1 Emissions from Lands Use Net of Livestock in Period T in GtCO2e

* Welfare Parameters

ALPHAF Scale Parameter 1 of Food Products in Utility Function /0.378/
ALPHAL Scale Parameter 1 of Livestock in Utility Function /0.345/
ALPHAE Scale Parameter 1 of Energy Services in Utility Function /0.112/
ALPHAT Scale Parameter 1 of Timber Products in Utility Function /0.026/
ALPHAP Scale Parameter 1 of Biodiversity in Utility Function /0.025/
ALPHAO Scale Parameter 1 of Other in Utility Function
BETAF Scale Parameter 2 of Food in Utility Function /0.056/
BETAL Scale Parameter 2 of Livestock in Utility Function /0.11/
BETAE Scale Parameter 2 of Energy in Utility Function /0.049/
BETAT Scale Parameter 2 of Timber in Utility Function /0.023/
BETAP Scale Parameter 2 of Biodiversity in Utility Function /0.052/
BETAO Scale Parameter 2 of Other in Utility Function
GAMMAF Subsistence Parameter For Food in Utility Function /0.33/
GAMMAL Subsistence Parameter For Livestock in Utility Function /0.003/
GAMMAE Subsistence Parameter For Energy in Utility Function /0.026/
GAMMAT Subsistence Parameter For Timber in Utility Function / 0.0265/
GAMMAP Subsistence Parameter For Rec. Services in Utility Function /0.028/
GAMMAO Subsistence Parameter For Other in Utility Function / 0.346/
KAPPA AIDADS Utility Function parameter / 0 /
DELTA0 Social Discount Rate /0.015/

* Terminal Conditions

SNLAND Shadow Price of Natural Land at time T /50/
SFLAND Shadow Price of Forest Land at time T /10/

* Exogenous Parameters

EPSILON A Small Number / 0.0001 /
SCALE Scaling Factor /0.0001/
SCALE1 Scaling Factor /10/
LAMBDA Marginal Utility of Money /1/  ;

FDPRODGR = TFPGR;
LPRODGR = TFPGR;
TPRODGR = TFPGR;
RECPRODGR = TFPGR;
FIXEDFGR = 0.005;
FOSSILC0 = FOSSILC * FOSSILE0;
FOSSILF0 = FERTIL0 / FERTPROD;
FOSSILQ0 = FOSSILE0 + FOSSILF0;
BIOFCC = 0.82*FOSSILC - ALANDC/(YIELD0*BIOFPROD);
BIOFCRED = 0.18 + (ALANDC/(YIELD0*BIOFPROD))/FOSSILC;
BIOFCRED2 = 0.76 + (ALANDC/(YIELDM0*BIOFPRODM))/FOSSILC;
BFRHO = 1 -  (1 / BFSIGMA);
LRHO = 1 -  (1 / LSIGMA);
FTRHO = 1 -  (1 / FTSIGMA);
BMRHO = 1 -  (1 / BMSIGMA);
RECRHO = 1 - (1 / RECSIGMA);
RECALPHA3 = 1 - RECALPHA - RECALPHA1 - RECALPHA2;
ALPHAO = 1 - ALPHAF - ALPHAL - ALPHAE - ALPHAT - ALPHAP;
BETAO = 1 - BETAF - BETAL - BETAE - BETAT - BETAP;
LANDUSEC01 = LANDUSEC0 - LLAND0*LLANDC;
LANDUSECT1 = 0.5 * LANDUSEC01;
YIELDT = YIELD0 * 1.9;
TLAND0 = ALAND0 + LLAND0 + NLAND0 + PLAND0 + FLAND0;

PARAMETERS

YEAR(t) Year
POP(t) Population in Billion People
YIELD(t) Agricultural Yield of Commercial Land in tons per Ha
YIELDM(t) Cellulosic Feedstocks Yield of Commercial Land in tons per Ha
YIELDGRM(t) Cellulosic Feedstocks Yield Growth Rate in tons per Ha per annum
FDPROD(t) Food Technology Index
LPROD(t) Livestock Technology Index
FOSSILP(t) Price of Fossil Fuels in USD per toe
FOREST0(v) Total Area of Forest Land of Vintage v in Period 1 in GHa
REPLANT0(v) Replanted Forest Area of Vintage v in period 1 in GHa
FOPRODGR(v) Yield Growth of vinrage v in Commercial Forestry Per Annum
FOPROD(v,t) Yield of Timber for vintage v in tons per Ha
FOPRODV(t)  Yield of Timber for vintage V in tons per Ha
FOPRODC(v,t) Cost of Timber for vintage v in USD'1000 per Ha
TPROD(t) Productivity of timb. proces. in tons of timb. prod. per ton of timber
CARBONST(v) Carbon Stock by Forest Vintage v in tCO2e per Ha
FORESTS(v) Carbon Sequestration by Forest Vintage v in tCO2e per Ha
ENEFF(t) Autonomous Energy Efficiency Improvement Rate
RECPROD(t) Recreational Services per Ha of Protected Land
OTHER(t) Other Goods and Services in Economy
FFGR(t) Fixed Factor Growth
GHGFL(t) GHG Flows in time t in GtCO2e
GHGST(t) GHG Stock in Time t in GtCO2e
TARGET(t) GHG Emissions Target Constraint
DELTA(t) Social Discount Rate
DELTAV(v) Forest Discount Rate;

loop(t, YEAR(t) = 2004 + ord(t));
POP(t) = POP0*POPT*exp(POPGR1*(ord(t)-1))/(POPT+POP0*(exp(POPGR1*(ord(t)-1))-1));
POP(t0) = POP0;
YIELD(t) = YIELD0*YIELDT*exp(YIELDGR*(ord(t)-1))/(YIELDT+YIELD0*(exp(YIELDGR*(ord(t)-1))-1));
YIELDGRM(t) = 0.115;
YIELDGRM(t)$(ord(t) ge 21) = 0.127;
YIELDGRM(t)$(ord(t) ge 41) = 0.138;
YIELDGRM(t)$(ord(t) ge 61) = 0.15;
YIELDGRM(t)$(ord(t) ge 81) = 0.161;
loop(t, YIELDM(t) = YIELDM0 + YIELDGRM(t)*(ord(t)-1));
YIELDM(t)$(ord(t) gt 100) = YIELDM("100");
loop(t, FDPROD(t) = FDPROD0*(1 + FDPRODGR)**(ord(t)-1));
loop(t, LPROD(t) = LPROD0*LPROD1*(1 + LPRODGR)**(ord(t)-1));
FOSSILP(t) = FOSSILP0*FOSSILPT*exp(FOSPGR*(ord(t)-1))/
(FOSSILPT+FOSSILP0*(exp(FOSPGR*(ord(t)-1))-1));
FOREST0(v) = FLAND0 / card(v);

FORYA = log(CARBON / sum(v, FOREST0(v) * 3.67*STOCKDEN*exp(-FORYB/(ord(v)))));

display forya;

REPLANT0(v) = FOREST0(v) / (card(v));
FOPRODGR(v) = 0;
FOPRODGR(v)$(ord(v) ge 15) = 0.011*exp(FORYA-FORYB/(ord(v)-FORYC));
FOPRODGRV = FOPRODGR("100");
FOPROD(v,t) = EPSILON;
FOPROD(v,t)$(ord(v) ge 15) = exp(FORYA-FORYB/(ord(v) -FORYC))
+ FOPRODGR(v)*(ord(t)-1);
FOPROD(v,t)$(ord(t) gt 100) = FOPROD(v,"100");
FOPRODV(t) = exp(FORYA-FORYB/(100-FORYC)) + FOPRODGRV *(ord(t)-1);
FOPRODV(t)$(ord(t) gt 100) = FOPRODV("100");
FOPRODC(v,t) = FORESTCC / FOPRODNL * FOPROD(v,t)$(ord(t) eq 1);
loop(v,CARBONST(v) = 3.67*STOCKDEN*(exp(FORYA-FORYB/ord(v))));
loop(v,FORESTS(v) = 3.67*STOCKDEN*(exp(FORYA-FORYB/(ord(v)+1))
-exp(FORYA-FORYB/ord(v))));
FORESTS(vV) = 0;
loop(t, TPROD(t) = TPROD0*((1+TPRODGR)**(ord(t)-1)));
loop(t, ENEFF(t) = ((1+ENEFFGR)**(ord(t)-1)));
loop(t, RECPROD(t) = (1+RECPRODGR)**(ord(t)-1));
loop(t, OTHER(t) = OTHER0*((1+TFPGR)**(ord(t)-1)));
loop(t, FFGR(t) = ((1+FIXEDFGR)**(ord(t)-1)));
loop(t, DELTA(t) = (1-DELTA0)**(ord(t)-1));
loop(v, DELTAV(v) = (1-DELTA0)**(99 + ord(v)));

option decimals = 7;

* Endogenous Variables

Variables

CLLAND(t) Amound of Pasture Land Converted to Crop Land
UTIL(t) Utility Function
WELF Social Welfare;

Positive variables

NLAND(t) Stock of Natural Land in GHa
PLAND(t) Stock of Protected Land in GHa
CLAND(t) Flow of Natural Land Converted into Commercial Land in GHa
CPLAND(t) Flow of Natural Land Converted into Protected Land in GHa
ALAND(t) Stock of Agricultural Land in GHa
LLAND(t) Stock of Pasture Land in GHa
CRLAND(t) Stock of Cropland in Gha
SHADOWCR(t) Shadow Price of Cropland
SHADOWM(t) Shadow Price of Cellulosic Feedstocks
MLAND(t) Stock of Cellulosic Feedstocks Land in Gha
FLAND(v,t) Stock of Forestry Land of Vintage v in GHa
FHLAND(v,t) Flow of Harvested Forestry Land of Vintage v in GHa
REPLANTV(t) Flow of Replanted Forestry Land in GHa
APROD(t) Amount of Agricultural Product Produced in Gton
APRODM(t) Amount of Cellulosic Feedstocks Produced in Gton
FEED(t) Amount of Crop Products consumed as livestock feed
LIVPROD(t) Amount of Livestock Product Produced in Gton
FIXED(t) Technology Fixed Factor in 2nd Gen. Biofuels
FOSSILE(t) Quantity of Fossil Fuels Combusted in Gtoe
FOSSILF(t) Quantity of Fossil Fuels Converted to Fertilizers in Gtoe
FERTILCR(t) Amount of Fertilizers used for Agricultural product in Gton
FERTILM(t) Amount of Fertilizers used for Cellulosic Feedstocks in Gton
ENERGY(t) Amount of Energy Produced in GToe
FPROD(t) Amount of Timber Products in Gton
FOOD(t) Amount of Agricultural Product Consumed as Food in Gton
BIOFCR(t) Amount of Agricultural Product Converted to Biofuels in Gtoe
BIOFM(t) Amount of Cellulosic Feedstocks Converted to Biofuels in Gtoe
RECSERV(t) Amount of Recreation Services Produced;

* Equations

EQUATIONS

TOTLAND(t) Total Land Constraint
CONVERSION(t) Natural Land Conversion Equation
ALANDTRAN(t) Agricultural Land Transition Equation
ALANDCOMP(t) Agricultural Land Composition
LLANDTRAN(t) Pasture Land Transition Equation
FLANDTRAN(v,t) Forestry Land Transition Equation
FLANDTRANB(v,t) Forestry Land Transition Equation
REPLANTRAN(v,t) Replanting Transition Equation
PLANDTRAN(t) Transition Equation for Protected Land
FTPROD(t) Fertilizers' Production Function
APRODF(t) Agricultural Product's Production Function
APRODCOMP(t) Agricultural Product Composition
APRODMF(t) Cellulosic Feedstocks Production Function
LPRODF(t) Livestock Production Function
SPRICECR(t) Shadow Price of Cropland
SPRICEM(t) Shadow Price of Cellulosic Feedstocks Land
FPRODF(t) Forestry Production Function
BIOFCRPF(t) 1st Gen. Biofuels Production Function
BIOFMPF(t) 2nd Gen. Biofuels Production Function
ENERGYF(t) Energy Production Fuction
RECSERVF(t) Recreation Services Production Function
UTILITY(t) Utlity Function
WELFARE Social Welfare;

* Land Use

TOTLAND(t)$(not0(t)) .. NLAND(t) + ALAND(t) + LLAND(t) + sum(v, FLAND(v,t))
+ PLAND(t) =e= TLAND0;
CONVERSION(t)$(notT(t)) .. NLAND(t+1) =e= NLAND(t) - CLAND(t) - CPLAND(t);
PLANDTRAN(t)$(notT(t))  .. 0 =e= SCALE1*(PLAND(t) + CPLAND(t) - PLAND(t+1));
ALANDTRAN(t)$(notT(t))  .. ALAND(t+1) =e= ALAND(t) + CLAND(t) - CLLAND(t)
+ sum(v, FHLAND(v,t)) - REPLANTV(t);
ALANDCOMP(t)$(notT(t))  .. ALAND(t) =e= CRLAND(t) + MLAND(t);
LLANDTRAN(t)$(notT(t)) ..  LLAND(t+1) =e= LLAND(t) + CLLAND(t);
FLANDTRAN(v,t)$(ord(v) lt card(v) - 1 and notT(t)) ..
FLAND(v+1,t+1) =e= FLAND(v,t) - FHLAND(v,t);
FLANDTRANB(v,t)$(notT(t)) .. FLAND('100',t+1) =e= FLAND('100',t) - FHLAND('100',t)
+ FLAND('99',t) - FHLAND('99',t);
REPLANTRAN(v0,t)$(notT(t)) .. FLAND(v0,t+1) =e= REPLANTV(t);


* Production

FTPROD(t)$(notT(t)) .. FERTILCR(t) + FERTILM(t) =e=  FERTPROD * FOSSILF(t) * POP(t);
APRODF(t)$(notT(t)) .. APROD(t) =l= YIELD(t) / POP(t) * (FTALPHA*(CRLAND(t))**FTRHO
+ (1-FTALPHA)*(FERTILCR(t)**FTRHO))**(1/FTRHO);
SPRICECR(t)$(notT(t)) .. APROD(t) * POP(t) / YIELD(t) *
((FTALPHA / SHADOWCR(t))**FTSIGMA) * ((FTALPHA**FTSIGMA) * (SHADOWCR(t) ** (1-FTSIGMA))
+ ((1-FTALPHA)** FTSIGMA) * (FOSSILP(t)** (1-FTSIGMA)))**(FTSIGMA/(1-FTSIGMA))
=l= CRLAND(t);
SPRICEM(t)$(notT(t)) .. APRODM(t) * POP(t) / YIELDM(t) *
((FTALPHA / SHADOWM(t))**FTSIGMA) * ((FTALPHA**FTSIGMA) * (SHADOWM(t) ** (1-FTSIGMA))
+ ((1-FTALPHA)** FTSIGMA) * (FOSSILP(t)** (1-FTSIGMA)))**(FTSIGMA/(1-FTSIGMA))
=l= MLAND(t);
APRODMF(t)$(notT(t)) .. APRODM(t) =l= YIELDM(t) / POP(t) * (FTALPHA*(MLAND(t))**FTRHO
+ (1-FTALPHA)*(FERTILM(t)**FTRHO))**(1/FTRHO);
LPRODF(t)$(notT(t)) .. LIVPROD(t) =l= LPROD(t) / POP(t) * (LALPHA*(LLAND(t))**LRHO
+ (1-LALPHA)*((FEED(t)*POP(t))**LRHO))**(1/LRHO);
FPRODF(t)$(notT(t)) .. 0 =e= SCALE*(TPROD(t) *
(sum(v, FOPROD(v,t)*FHLAND(v,t)))/ POP(t) - FPROD(t));
BIOFCRPF(t)$(notT(t)) .. BIOFCR(t) =e= BIOFPROD * (APROD(t) - FEED(t) - FOOD(t)/FDPROD(t));
BIOFMPF(t)$(notT(t)) .. BIOFM(t) =l= BIOFPRODM * (BMALPHA*(APRODM(t))**BMRHO +
((1-BMALPHA)** FFGR(t)) * (FIXED(t))**BMRHO)**(1/BMRHO);
ENERGYF(t)$(notT(t)) .. ENERGY(t) =l= ENEFF(t)* BFGAMMA * (BFALPHA*(BIOFCR(t))**BFRHO +
 (1 - BFALPHA) * ((FOSSILE(t) + BIOFM(t))**BFRHO))**(1/BFRHO);
RECSERVF(t)$(notT(t)) .. RECSERV(t) =l= RECGAMMA / POP(t) * (RECALPHA*(ALAND(t))**RECRHO
+ RECALPHA1*(LLAND(t))**RECRHO  + RECALPHA2*(sum(v, FLAND(v,t)))**RECRHO
+ RECALPHA3*(NLAND(t) + RECPLANDP * PLAND(t))**RECRHO)**(1/RECRHO);

* Utility

UTILITY(t)$(notT(t)) .. UTIL(t) =l= exp(KAPPA +
((ALPHAF+BETAF*exp(UTIL(t))) / (1 + exp(UTIL(t)))) * (log(FOOD(t) - GAMMAF))
+ ((ALPHAL+BETAL*exp(UTIL(t))) / (1 + exp(UTIL(t)))) * (log(LIVPROD(t) - GAMMAL))
+ ((ALPHAE+BETAE*exp(UTIL(t))) / (1 + exp(UTIL(t)))) * (log(ENERGY(t) - GAMMAE))
+ ((ALPHAT+BETAT*exp(UTIL(t))) / (1 + exp(UTIL(t)))) * (log(FPROD(t) - GAMMAT))
+ ((ALPHAP+BETAP*exp(UTIL(t))) / (1 + exp(UTIL(t)))) * (log(RECSERV(t) - GAMMAP))
+ ((ALPHAO+BETAO*exp(UTIL(t))) / (1 + exp(UTIL(t)))) * (log(OTHER(t) - GAMMAO)));

* Welfare

Welfare .. Welf =e= 0.1*(sum(t$(notT(t)), DELTA(t) * (LAMBDA*UTIL(t)
- APROD(t) / YIELD(t) * ((FTALPHA**FTSIGMA) * (SHADOWCR(t) ** (1-FTSIGMA))
+ ((1-FTALPHA)** FTSIGMA) * (FOSSILP(t)** (1-FTSIGMA)))**(1 /(1-FTSIGMA))
- APRODM(t) / YIELDM(t) * ((FTALPHA**FTSIGMA) * (SHADOWM(t) ** (1-FTSIGMA))
+ ((1-FTALPHA)** FTSIGMA) * (FOSSILP(t)** (1-FTSIGMA)))**(1 /(1-FTSIGMA))
+ BIOFC*BIOFCR(t)
+ BIOFCM*BIOFM(t)
- FOSSILP(t) * FOSSILE(t)
+ sum(v, FOPRODC(v,t)*FHLAND(v,t))
+ HARADJ * sqr(sum(v, FHLAND(v,t)) - REPLANTV(t))
+ TPRODC * FPROD(t) / TPROD(t)
+ REPLANTC * REPLANTV(t)
+ HARADJ1*sqr(sum(v, FHLAND(v,t+1))-sum(v, FHLAND(v,t)))
+ FERTILC * (FERTILCR(t) + FERTILM(t))
+ FDPRODC * FOOD(t) / FDPROD(t)
+ LADJ * sqr(CLLAND(t))
+ LPRODC * LIVPROD(t) * LPROD0 / LPROD(t)
+ LPRODC1 * LIVPROD(t) * LPROD0 * LPROD1 / LPROD(t)
+ RECCOST / RECPROD(t) * PLAND(t)
+ RECADMCOST*CPLAND(t)
+ RECADMCOST1*sqr(CPLAND(t))
- (NLAND(t)-NLAND(t+1)) * (SHADOWCR(t)
- CLALPHA*log(NLAND(t+1)/NLAND0)
+ CLGAMMA*sqr(1 - NLAND(t+1)/NLAND(t))) ))
+ SNLAND * DELTA('200') * NLAND('200')
+ SFLAND * sum(v, DELTAV(v) * FLAND(v,'200')));

* Intermediate Bounds

NLAND.lo(m) = EPSILON;
NLAND.lo(tT) = EPSILON;
NLAND.up(m) = NLAND0;
NLAND.up(tT) = NLAND0;
PLAND.lo(t) = PLAND0;
PLAND.up(m) = TLAND0;
PLAND.up(tT) = TLAND0;
ALAND.up(t) = TLAND0;
CRLAND.up(t) = TLAND0;
LLAND.up(t) = LLAND0;
LLAND.lo(t) = 0.1;
CLLAND.up(t) = TLAND0;
CLLAND.lo(t) = -TLAND0;
MLAND.up(t) = TLAND0;
MLAND.lo(t) = 0.0001*ALAND0;
SHADOWCR.lo(t) = EPSILON;
SHADOWCR.up(t) = 10000;
SHADOWM.lo(t) = EPSILON;
SHADOWM.up(t) = 10000;
FLAND.lo(v,t) = EPSILON;
FLAND.up(v,t) = TLAND0;
CLAND.up(t) = TLAND0;
CPLAND.up(t) = TLAND0;
FHLAND.up(v,t) = TLAND0;
REPLANTV.up(t) = TLAND0;
FOSSILF.up(t) = 10000;
FOSSILE.up(t) = 10000;
FERTILM.lo(t) = 0.0001*FERTPROD * FOSSILF0;
FERTILM.up(t) = 10000;
FERTILCR.up(t) = 10000;
APROD.up(t) = 100000;
APRODM.lo(t) = YIELDM0 / POP0 * (FTALPHA*(MLAND.lo(t))**FTRHO
+ (1-FTALPHA)*(FERTILM.lo(t)**FTRHO))**(1/FTRHO);
APRODM.up(t) = 100000;
FEED.lo(t) = EPSILON;
FEED.up(t) = 100000;
LIVPROD.lo(t) = GAMMAL + EPSILON;
LIVPROD.up(t) = 100000;
FIXED.up(t) = 1;
FPROD.lo(t) = TPROD(t) * FOPRODV(t) * (0.0162 / POP(t));
FPROD.up(t) = 100000;
FOOD.lo(t) = GAMMAF + EPSILON;
FOOD.up(t) = 100000;
BIOFCR.lo(t) = EPSILON;
BIOFM.lo(t) = EPSILON;
BIOFCR.up(t) = 100000;
BIOFM.up(t) = 100000;
ENERGY.lo(t) = GAMMAE + EPSILON;
RECSERV.lo(t) = GAMMAP + EPSILON;
RECSERV.up(t) = 100000;

UTIL.lo(t) = -100000;
UTIL.up(t) = 100000;
WELF.lo = -100000;
WELF.up = 100000;

* Initial Conditions

NLAND.l(t) = NLAND0;
PLAND.l(t) = PLAND0;
ALAND.l(t) = ALAND0;
CRLAND.l(t) = 0.99*ALAND0;
MLAND.l(t) = 0.01*ALAND0;
LLAND.l(t) = LLAND0;
CLAND.l(t) = 0;
CPLAND.l(t) = 0;
CLLAND.l(t) = 0;
FOSSILE.l(t) = FOSSILE0 / POP(t);
FOSSILF.l(t) = FOSSILF0 / POP(t);
FERTILCR.l(t) = 0.999*FERTPROD * FOSSILF0;
FERTILM.l(t) = 0.001*FERTPROD * FOSSILF0;
FLAND.l(v,t) = FOREST0(v);
FHLAND.l(v,t) = 0;
FHLAND.l(vV,t) = FOREST0(vV);
REPLANTV.l(t) = sum(v, REPLANT0(v));
FPROD.l(t) =  TPROD(t) * FOPRODV(t) * (FLAND.l('100',t) / POP(t));
APROD.l(t) = YIELD(t) / POP(t) * (FTALPHA*(CRLAND.l(t))**FTRHO
+ (1-FTALPHA)*(FERTILCR.l(t)**FTRHO))**(1/FTRHO);
APRODM.l(t) = YIELDM(t) / POP(t) * (FTALPHA*(MLAND.l(t))**FTRHO
+ (1-FTALPHA)*(FERTILM.l(t)**FTRHO))**(1/FTRHO);
FEED.l(t) = 0.4 * APROD.l(t);
BIOFCR.l(t) = BIOF0 / POP(t);
FIXED.l(t) = 0.05;
BIOFM.l(t) = BIOFPRODM * (BMALPHA*(APRODM.l(t))**BMRHO
+ ((1-BMALPHA) ** FFGR(t)) * (FIXED.l(t))**BMRHO)**(1/BMRHO);
FOOD.l(t) = FDPROD(t) * (APROD.l(t) - FEED.l(t) - BIOFCR.l(t)/BIOFPROD);
LIVPROD.l(t) = LPROD(t) / POP(t) * (LALPHA*(LLAND.l(t))**LRHO
+ (1-LALPHA)*((FEED.l(t)*POP(t))**LRHO))**(1/LRHO);
ENERGY.l(t) = ENEFF(t)* BFGAMMA * (BFALPHA*(BIOFCR.l(t))**BFRHO +
 (1 - BFALPHA) * ((FOSSILE.l(t) + BIOFM.l(t))**BFRHO))**(1/BFRHO);
RECSERV.l(t) = RECGAMMA / POP(t) * (RECALPHA*(ALAND.l(t))**RECRHO
+ RECALPHA1*(LLAND.l(t))**RECRHO  + RECALPHA2*(sum(v, FLAND.l(v,t)))**RECRHO
+ RECALPHA3*(NLAND.l(t) + RECPLANDP * PLAND.l(t))**RECRHO)**(1/RECRHO);

equation findshc(t);

findshc(t)$(notT(t)) .. APROD.l(t) * POP(t) / YIELD(t) *
((FTALPHA / SHADOWCR(t))**FTSIGMA) * ((FTALPHA**FTSIGMA) * (SHADOWCR(t) ** (1-FTSIGMA))
+ ((1-FTALPHA)** FTSIGMA) * (FOSSILP(t)** (1-FTSIGMA)))**(FTSIGMA/(1-FTSIGMA))
=e= CRLAND.l(t);

model findshcr /findshc/;
solve findshcr using cns;

equation findsm(t);

findsm(t)$(notT(t)) .. APRODM.l(t) * POP(t) / YIELDM(t) *
((FTALPHA / SHADOWM(t))**FTSIGMA) * ((FTALPHA**FTSIGMA) * (SHADOWM(t) ** (1-FTSIGMA))
+ ((1-FTALPHA)** FTSIGMA) * (FOSSILP(t)** (1-FTSIGMA)))**(FTSIGMA/(1-FTSIGMA))
=e= MLAND.l(t);

model findshm /findsm/;
solve findshm using cns;

util.l(t) = 25 * exp((ord(t)/card(t)));

equation findu(t);

findu(t)$(notT(t)) .. UTIL(t) =e= exp(KAPPA +
((ALPHAF+BETAF*exp(UTIL(t))) / (1 + exp(UTIL(t)))) * (log(FOOD.l(t) - GAMMAF))
+ ((ALPHAL+BETAL*exp(UTIL(t))) / (1 + exp(UTIL(t)))) * (log(LIVPROD.l(t) - GAMMAL))
+ ((ALPHAE+BETAE*exp(UTIL(t))) / (1 + exp(UTIL(t)))) * (log(ENERGY.l(t) - GAMMAE))
+ ((ALPHAT+BETAT*exp(UTIL(t))) / (1 + exp(UTIL(t)))) * (log(FPROD.l(t) - GAMMAT))
+ ((ALPHAP+BETAP*exp(UTIL(t))) / (1 + exp(UTIL(t)))) * (log(RECSERV.l(t) - GAMMAP))
+ ((ALPHAO+BETAO*exp(UTIL(t))) / (1 + exp(UTIL(t)))) * (log(OTHER(t) - GAMMAO)));

model findutil /findu/;
solve findutil using cns;


Welf.l = 0.1*(sum(t$(notT(t)), DELTA(t) * (LAMBDA*UTIL.l(t)
- APROD.l(t) / YIELD(t) * ((FTALPHA**FTSIGMA) * (SHADOWCR.l(t) ** (1-FTSIGMA))
+ ((1-FTALPHA)** FTSIGMA) * (FOSSILP(t)** (1-FTSIGMA)))**(1 /(1-FTSIGMA))
- APRODM.l(t) / YIELDM(t) * ((FTALPHA**FTSIGMA) * (SHADOWM.l(t) ** (1-FTSIGMA))
+ ((1-FTALPHA)** FTSIGMA) * (FOSSILP(t)** (1-FTSIGMA)))**(1 /(1-FTSIGMA))
+ BIOFC*BIOFCR.l(t)
+ BIOFCM*BIOFM.l(t)
- FOSSILP(t)*FOSSILE.l(t)
+ sum(v, FOPRODC(v,t)*FHLAND.l(v,t))
+ HARADJ * sqr(sum(v, FHLAND.l(v,t)) - REPLANTV.l(t))
+ TPRODC * FPROD.l(t) / TPROD(t)
+ REPLANTC * REPLANTV.l(t)
+ HARADJ1*sqr(sum(v, FHLAND.l(v,t+1))-sum(v, FHLAND.l(v,t)))
+ FERTILC * (FERTILCR.l(t) + FERTILM.l(t))
+ FDPRODC * FOOD.l(t) / FDPROD(t)
+ LPRODC * LIVPROD.l(t) * LPROD0 / LPROD(t)
+ LPRODC1 * LIVPROD.l(t) * LPROD0 * LPROD1 / LPROD(t)
+ RECCOST / RECPROD(t) * PLAND.l(t)
+ RECADMCOST*CPLAND.l(t)
+ RECADMCOST1*sqr(CPLAND.l(t))
- (NLAND.l(t)-NLAND.l(t+1)) * (SHADOWCR.l(t)
- CLALPHA*log(NLAND.l(t+1)/NLAND0)
+ CLGAMMA*sqr(1 - NLAND.l(t+1)/NLAND.l(t))) ))
+ SNLAND * DELTA('200') * NLAND.l('200')
+ SFLAND * sum(v, DELTAV(v) * FLAND.l(v,'200')));

* Fixed Factor

FIXED.fx(t) = 0.05;

* No Late Deforestation

CLAND.fx(d) = 0;

* No Harvesting of Young vintages

FHLAND.fx(v,t)$(ord(v) le 80) = 0;

* Starting values

NLAND.fx(t0) = NLAND0;
PLAND.fx(t0) = PLAND0;
ALAND.fx(t0) = ALAND0;
LLAND.fx(t0) = LLAND0;
FLAND.fx(v,t0) = FOREST0(v);

* Model

Option limrow=0,limcol=0 ;
OPTION ITERLIM = 500000;
OPTION RESLIM = 500000;
OPTION DOMLIM = 1000;
OPTION NLP = conopt;
OPTION solprint = on;

model land /totland, conversion, alandtran, alandcomp, flandtran, flandtranb,
replantran, llandtran, plandtran, ftprod, aprodf, aprodmf, lprodf, fprodf,
biofcrpf, biofmpf, energyf, recservf, utility, spricecr, spricem, welfare/;


solve land using nlp maximizing WELF;
solve land using nlp maximizing WELF;
solve land using nlp maximizing WELF;


