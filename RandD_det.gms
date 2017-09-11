**Written by Yongyang Cai and Alla Golub

SETS
t        period in the model /1*30/
t0(t)    first period in the model /1/
notT(t)  any but final period in the model
endT(t)  final period
allgoods inputs and outputs
         /landfert
          landfeed
          crop
          lvstk
          biofuel
          cropfood
          lvstkfood
          timber
          wood
          fertilizer
          petroleum
          energy
          C,P,F,FF,E/
j(allgoods) produced goods and services
         /landfert
          landfeed
          crop
          lvstk
          biofuel
          cropfood
          lvstkfood
          timber
          wood
          fertilizer
          petroleum
          energy/
i(j) intemedaite inputs
         /landfert
          landfeed
          crop
          lvstk
          biofuel
          timber
          fertilizer
          petroleum/
j_E(j) production activities that use input other g&s
         /crop
          lvstk
          biofuel
          cropfood
          lvstkfood
          timber
          wood
          fertilizer
          petroleum/
*Endowments: C denote cropland, P pasture land, F commercial forest, FF fossil fuel reserves, and E other goods and services;
endowment(allgoods) /C,P,F,FF,E/
LU(allgoods) /C,P,F/
good(allgoods) final consumption goods /cropfood, lvstkfood, energy, wood, E/;
alias(t1,t);
notT(t) = YES$(ord(t)<card(t));
endT(t) = YES$(ord(t)=card(t));

*Miscelenous
Scalar
deltat number of years per period /10/
epsilon A Small Number / 0.0001 /;

** Base year (2004) data and demand system and production sectors parameters****
********************************************************************************

*Consumption and demand system parameters***************************************
Parameters
y_0(good)    base year final consumption in trill 2004 USD
alpha(good)  low bound on marginal budget share
beta(good)   upper bound on marginal budget share
sbsts(good)  subsistance
kappa        AIDADS parameter kappa=1+lnA
in_util      initial utility level;

$GDXIN basedata.gdx
$LOAD  y_0
$GDXIN

$GDXIN parameters.gdx
$LOAD alpha, beta, sbsts, kappa, in_util
$GDXIN
********************************************************************************

*Production and production function parameters**********************************
Parameters
q_0(i)                     base year output of sector producing intermediate input in bill units
x_0(allgoods,j)            base year intermidiate input used in more than one sector
E_0j(j)                    other goods and services used in each sector in trill 2004 USD
share(j)                   cost share in normalized CES production function
rho(j)                     parameter representing substitution in CES production function
L_0(LU)                    base year area of each land use in bill ha
FF_0                       base year fossil fuel extracted in bill toe;

$GDXIN basedata.gdx
$LOAD  q_0, x_0, E_0j, L_0, FF_0
$GDXIN

$GDXIN parameters.gdx
$LOAD  share, rho
$GDXIN
********************************************************************************
********************************************************************************

**Parametrize relationship between R&D knowledge stock and TFP******************
set nlag number of decadal lags uncluded in estimation of R&D knowledge stock /1*5/
alias(nlag1, nlag);

* R&D parameters
parameters
c_RD(nlag)      coefficient for lagged R&D
RD_hist(nlag)   historical decadal annual global public R&D spending in trill USD
initGlobalRD    initial global public R&D spending in trill USD
TFP0            TFP index in 2004 / 1 /
;

set hist_ys /1954*2011/;
set hist_RD /RD/;

$offlisting
Table RD_hist_ann(hist_ys,hist_RD) historical annual global public R&D spending in bill USD
$ondelim
$include global_public_RD.csv
$offdelim
;
$onlisting

*Construct historical decadal annual global R&D and change units (billions USD to trillions USD)
RD_hist(nlag) = sum(hist_ys$(hist_ys.val>=2004-deltat*ord(nlag) and hist_ys.val<2004-deltat*(ord(nlag)-1)), RD_hist_ann(hist_ys,'RD')) / deltat / 1000;

initGlobalRD = sum(hist_ys$(hist_ys.val>=2004 and hist_ys.val<=2011), RD_hist_ann(hist_ys,'RD')) / (2011-2004+1)/1000;

display RD_hist, initGlobalRD;

parameters
        GamShape        shape of gamma distribution (delta)  / 0.902 /
        GamScale        scale of gamma distribution (lambda) / 0.642 /
        GamVann         values of coefficients in gamma distributions in annual time steps
        GamSum
        intercept       intercept of TFP vs RD stock
        slope           slope of TFP vs RD stock
        RDstock0
;
set gg /1*50/;
GamVann(gg) = ord(gg)**(GamShape/(1-GamShape)) * GamScale**(ord(gg)-1);
GamSum = sum(gg, GamVann(gg));
GamVann(gg) = GamVann(gg) / GamSum;
display GamVann;

* Using US data, Baldos et al. (2015) estimate elasticity and intercept in the
* log-log relationship between R&D knowledge stock and TFP. We assume there is a constant ratio
* between global R&D spending and US R&D spending. We take value of elasticity from Baldos et al.(2015).
* With the log-log relationship between R&D stock and TFP, we only need to calibrate
* the intercept. In addition to the estimated elasticity 0.3, we consider 0.2 and 0.4.

c_RD(nlag) = sum(gg$(ord(gg)>(ord(nlag)-1)*deltat and ord(gg)<=ord(nlag)*deltat), GamVann(gg)) * 1000;
RDstock0 = sum(nlag, c_RD(nlag)*RD_hist(nlag));


* Elasticities
set ee elasticity values considered in the analysis /1*3/;
alias(ee,ee2);
parameters   slopes(ee)
             intercepts(ee)
;
slopes('1') = 0.2;
slopes('2') = 0.3;
slopes('3') = 0.4;
intercepts(ee) = log(TFP0) - slopes(ee)*log(RDstock0);

slope = sum(ee$(ord(ee)=(1+card(ee))/2), slopes(ee));
intercept = sum(ee$(ord(ee)=(1+card(ee))/2), intercepts(ee));

display slopes, intercepts, slope, intercept;
display c_RD;
display RDstock0, intercepts;
********************************************************************************

**Exogenous Projections*********************************************************
********************************************************************************
**Shared Socioeconomic Pathways (SSPs)******************************************
set nscen number of SSP scenarios /1*5/;
alias(nscen, nscen2);

$offlisting
*Read SSP scenarios of population bill people
Table PiAll(t, nscen)
$ondelim
$include pop_dec.csv
$offdelim
;

*Read SSP scenarios of cumulative growth rate of global GDP
Table gwpAll(t, nscen)
$ondelim
$include gdp_dec.csv
$offdelim
;

*Read SSP scenarios of change in surface temperature
Table TAall(t, nscen)
$ondelim
$include temperature_dec.csv
$offdelim
;

*Read SSP scenarios of cumulative growth rate of oil and gas extraction
Table ffgrAll(t, nscen)
$ondelim
$include FF_dec.csv
$offdelim
;
$onlisting

Parameter
Pi(t)          population bill people
TA(t)          change in global surface temparature relative to preindustrial times
FF(t)          fossil fuels available in the PE economy in bill toe
FFall(t,nscen) fossil fuels available in the PE economy by scenario in bill toe
Eall(t,nscen)  quantity of other g&s by scenario in trill 2004 USD
E(t)           quantity of other g&s in trill 2004 USD
;

Scalar
E_0 other g&s available in 2004 measured in trill 2004 USD;
E_0 = sum(j_E, x_0('E',j_E)) + y_0('E') + RD_hist_ann('2004','RD')/1000;
Eall(t,nscen) = E_0 * gwpAll(t,nscen);
display E_0,y_0;
TAall(t,nscen) = TAall(t,nscen) - TAall('1',nscen);
FFall(t, nscen) = FF_0 * ffgrALL(t,'2');

Pi(t) = PiAll(t,'2');
TA(t) = TAall(t,'2');
E(t) = Eall(t,'2');
FF(t) = FFall(t,'2');
********************************************************************************

**Technology********************************************************************
Parameter
theta(j,t) technology parameter;
theta(j,t) = 1;

*technology in food production
theta('cropfood',t) = exp(0.008*(1-exp(-0.0214*deltat*(ord(t)-1)))/0.0214);
theta('lvstkfood',t) = exp(0.008*(1-exp(-0.0214*deltat*(ord(t)-1)))/0.0214);

*technology in wood processing sector
theta('wood',t) = exp(0.009*(1-exp(-0.0226*deltat*(ord(t)-1)))/0.0226);

*technology in energy sector
theta('energy',t) = exp(0.01*(1-exp(-0.007*deltat*(ord(t)-1)))/0.007);
theta('energy',t)$(ord(t)>11) = theta('energy','11')*exp(0.01*(1-exp(-0.05*deltat*(ord(t)-11)))/0.05);
********************************************************************************

**Other Exogenous Projections***************************************************
parameter L(LU,t)      land employed in use LU bill ha;
L(LU,t) = L_0(LU);
********************************************************************************
**End exogenous projections*****************************************************

parameters
discountFactor discount factor /0.963/
gamma    elasticity of marginal utility /2/
DamCoef  coefficient representing damage of increasing temperature on crop production /0.049/
;

parameter NumRegret number of periods for computing regret;
NumRegret = 200/deltat;

parameter tstart;
tstart = 1;

Variables
big_u1        social planner objective
;

Positive variables
c1(t)         per capita consumption equivalent
y1(good,t)    output of sector producing final consumption good
q1(i,t)       output of sector producing intermediate input
x1(allgoods,j,t) intermediate input used in more than one sector

TFP1(t)       TFP in agriculture
RD1(t)        annual global R&D investment (in trillion of USD)
RDstock1(t)
;

Equations
obj1                  social planner objective
utility1(t)           per capita AIDADS utility

fertilizer_q1(t)      fertilizer sector output
landfert_q1(t)        land-fertilizer composite output
crop_q1(t)            crop sector output
landfeed_q1(t)        land-feed composite output
lvstk_q1(t)           livestock sector output
biofuels_q1(t)        biofuels sector output
cropfood_y1(t)        crop-based food sector output
lvstkfood_y1(t)       lvstk-based food sector output
petroleum_q1(t)       petroleum sector output
timber_q1(t)          timber sector output
wood_y1(t)            processed wood sector output
energy_y1(t)          energy sector output

mc_crop1(t)           market clearing condition for crop output
mc_extraction1(t)     market clearing condition for extracted oil and gas
mc_E1(t)              market clearing condition for other g&s

TFPvsRDstock_1(t)     map from US R&D spending to TFP
RDstockvsRD_1(t)      R&D knowledge stock
StableRD1(t)
;

obj1..                big_U1 =e= sum(t$(ord(t)>=tstart), discountFactor**((ord(t)-tstart)*deltat) * Pi(t) * c1(t)**(1-gamma)/(1-gamma));

utility1(t)$(ord(t)>=tstart)..         sum(good,(alpha(good)+beta(good)*c1(t))/(1+c1(t))*log(y1(good,t)/Pi(t) - sbsts(good))) - log(c1(t)) =e= kappa;

fertilizer_q1(t)$(ord(t)>=tstart)..     q1('fertilizer',t) =e= q_0('fertilizer')*(share('fertilizer') * (x1('FF','fertilizer',t)/x_0('FF','fertilizer'))**rho('fertilizer') +
                                (1-share('fertilizer'))*(x1('E','fertilizer',t)/E_0j('fertilizer'))**rho('fertilizer'))**(1/rho('fertilizer'));

landfert_q1(t)$(ord(t)>=tstart)..       q1('landfert',t) =e= q_0('landfert') *(share('landfert') * (L('C',t)/L_0('C'))**rho('landfert') +
                                (1-share('landfert')) * (q1('fertilizer',t)/q_0('fertilizer'))**rho('landfert'))**(1/rho('landfert'));

crop_q1(t)$(ord(t)>=tstart)..           q1('crop',t) =e=  q_0('crop') * TFP1(t) * (1-DamCoef*TA(t)) *
                                 (share('crop') * (q1('landfert',t)/q_0('landfert'))**rho('crop')
                                 + (1-share('crop')) * (x1('E','crop',t)/E_0j('crop'))**rho('crop'))**(1/rho('crop'));

landfeed_q1(t)$(ord(t)>=tstart)..       q1('landfeed',t) =e= q_0('landfeed') * (share('landfeed') * (L('P',t)/L_0('P'))**rho('landfeed') + (1-share('landfeed')) * ((x1('crop','landfeed',t)/TFP1(t))/x_0('crop','landfeed'))**rho('landfeed'))**(1/rho('landfeed'));

lvstk_q1(t)$(ord(t)>=tstart)..          q1('lvstk',t) =e= q_0('lvstk') * TFP1(t) *  (share('lvstk') * (q1('landfeed',t)/q_0('landfeed'))**rho('lvstk') + (1-share('lvstk')) * (x1('E','lvstk',t)/E_0j('lvstk'))**rho('lvstk'))**(1/rho('lvstk'));


biofuels_q1(t)$(ord(t)>=tstart)..       q1('biofuel',t) =e= q_0('biofuel') * (share('biofuel') * (x1('crop','biofuel',t)/x_0('crop','biofuel'))**rho('biofuel')
                                 + (1-share('biofuel')) * (x1('E','biofuel',t)/E_0j('biofuel'))**rho('biofuel'))**(1/rho('biofuel'));

cropfood_y1(t)$(ord(t)>=tstart)..       y1('cropfood',t) =e= theta('cropfood',t) * y_0('cropfood')*(share('cropfood') * (x1('crop','cropfood',t)/x_0('crop','cropfood'))**rho('cropfood') +
                                (1-share('cropfood'))*(x1('E','cropfood',t)/E_0j('cropfood'))**rho('cropfood'))**(1/rho('cropfood'));

lvstkfood_y1(t)$(ord(t)>=tstart)..      y1('lvstkfood',t) =e= theta('lvstkfood',t) * y_0('lvstkfood')*(share('lvstkfood') * (q1('lvstk',t)/q_0('lvstk'))**rho('lvstkfood') + (1-share('lvstkfood'))*(x1('E','lvstkfood',t)/E_0j('lvstkfood'))**rho('lvstkfood'))**(1/rho('lvstkfood'));


petroleum_q1(t)$(ord(t)>=tstart)..      q1('petroleum',t) =e= q_0('petroleum')*(share('petroleum') * (x1('FF','petroleum',t)/x_0('FF','petroleum'))**rho('petroleum') +
                                (1-share('petroleum'))*(x1('E','petroleum',t)/E_0j('petroleum'))**rho('petroleum'))**(1/rho('petroleum'));

timber_q1(t)$(ord(t)>=tstart)..         q1('timber',t) =e= q_0('timber') * (share('timber') * (L('F',t)/L_0('F'))**rho('timber') +
                                (1-share('timber')) * (x1('E','timber',t)/E_0j('timber'))**rho('timber'))**(1/rho('timber'));

wood_y1(t)$(ord(t)>=tstart)..           y1('wood',t) =e= theta('wood',t) * y_0('wood') * (share('wood') * (q1('timber',t)/q_0('timber'))**rho('wood') +
                                (1-share('wood')) * (x1('E','wood',t)/E_0j('wood'))**rho('wood'))**(1/rho('wood'));

energy_y1(t)$(ord(t)>=tstart)..         y1('energy',t) =e= theta('energy',t) * y_0('energy') * (share('energy') * (q1('biofuel',t)/q_0('biofuel'))**rho('energy') +
                                (1-share('energy')) * (q1('petroleum',t)/q_0('petroleum'))**rho('energy'))**(1/rho('energy'));


mc_extraction1(t)$(ord(t)>=tstart)..    x1('FF','fertilizer',t) + x1('FF','petroleum',t) =e= FF(t);

mc_crop1(t)$(ord(t)>=tstart)..          x1('crop','cropfood',t) + x1('crop','biofuel',t) + x1('crop', 'landfeed',t) =e= q1('crop',t);

mc_E1(t)$(ord(t)>=tstart)..             sum(j_E, x1('E',j_E,t)) + y1('E',t) + RD1(t) =e=  E(t);

TFPvsRDstock_1(t)$(ord(t)>=tstart)..    log(TFP1(t)) =e= intercept + slope*log(RDstock1(t));

RDstockvsRD_1(t)$(notT(t) and ord(t)>=tstart).. RDstock1(t+1) =e= sum(nlag$(ord(nlag)<=ord(t)), c_RD(nlag)*sum(t1$(ord(t1)=ord(t)+1-ord(nlag)), RD1(t1))) +
                                                        sum(nlag$(ord(nlag)>ord(t)), c_RD(nlag)*sum(nlag1$(ord(nlag1)=ord(nlag)-ord(t)), RD_hist(nlag1)));

StableRD1(t)$(ord(t)<card(t))..                 RD1(t+1) =g= RD1(t);

********************************************************************************
*** initial guess **************************************************************

y1.l(good,t) = y_0(good);
q1.l(i,t) = q_0(i);
x1.l(allgoods,j,t) = x_0(allgoods,j);
********************************************************************************
**bounds on variables

c1.lo(t) = epsilon;

* level of inermediate input must be greater than zero
x1.lo(allgoods,j,t) = epsilon;
q1.lo(i,t) = epsilon;


RD1.lo(t) = epsilon;
TFP1.lo(t) = epsilon;
RDstock1.lo(t) = epsilon;

RDstock1.fx('1') = RDstock0;

*restrict growth of first generation biofuels
Parameters
biof_index(t) level of first generation biofuel production (2004 is 1)
$include biof_dec.prn
;
x1.up('crop','biofuel',t) = x_0('crop','biofuel') * biof_index(t);
********************************************************************************

** Solution options
option iterlim = 99900;
option reslim = 99999;
option solprint = on;
option limrow = 0;
option limcol = 0;
option nlp = conopt;

* Do not use "all", as this file will be used in MMR file
model welf1 / obj1, utility1,
fertilizer_q1, landfert_q1, crop_q1, landfeed_q1, lvstk_q1, biofuels_q1, petroleum_q1, timber_q1,
cropfood_y1, lvstkfood_y1, wood_y1, energy_y1,
mc_crop1, mc_extraction1, mc_E1,
TFPvsRDstock_1, RDstockvsRD_1, StableRD1 /;

parameters
TFPsol(t)
RDsol(t)
nnn
;

* per capita consumption greater than subsistance
y1.lo(good,t) = Pi(t)*(sbsts(good) + epsilon);

TFP1.fx('1') = 1;
RD1.l(t) = E(t)*0.001;

tstart = 1;

nnn = 0;
Repeat(
  nnn = nnn+1;
  solve welf1 using nlp maximizing big_u1;
until ((welf1.MODELSTAT=2 and welf1.SOLVESTAT=1) or nnn>=10) );

solve welf1 using nlp maximizing big_u1;
ABORT$(welf1.MODELSTAT <> 2) "Model not normally completed";
ABORT$(welf1.SOLVESTAT <> 1) "No local optimum found";

set restartStage /4,7,10,15/;

loop(restartStage,
  tstart = restartStage.val;
  TFPsol(t)$(ord(t)<=tstart) = TFP1.l(t);
  RDsol(t)$(ord(t)<=tstart) = RD1.l(t);

  TFP1.fx(t)$(ord(t)<=tstart) = TFPsol(t);
  RD1.fx(t)$(ord(t)<=tstart) = RDsol(t);

  nnn = 0;
  Repeat(
    nnn = nnn+1;
    solve welf1 using nlp maximizing big_u1;
  until ((welf1.MODELSTAT=2 and welf1.SOLVESTAT=1) or nnn>=10) );

  solve welf1 using nlp maximizing big_u1;
  ABORT$(welf1.MODELSTAT <> 2) "Model not normally completed";
  ABORT$(welf1.SOLVESTAT <> 1) "No local optimum found";
);

* relax fixed constraints for later use
RD1.lo(t) = epsilon;
TFP1.lo(t) = epsilon;
RD1.up(t) = 10000;
TFP1.up(t) = 100;

********************************************************************************
********************************************************************************
