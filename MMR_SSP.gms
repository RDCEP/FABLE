* Written by Yongyang Cai

**************************************************************
************* min-max regret *********************************
**************************************************************

slope = sum(ee$(ord(ee)=(1+card(ee))/2), slopes(ee));
intercept = log(TFP0) - slope*log(RDstock0);

Variables
  maxRegret             max regret
;

Positive variables
c(t,nscen)              per capita consumption equivalent
y_other(t,nscen)        consumped other goods and services
y_cropfood(t,nscen)     output of sector producing final consumption good
y_lvstkfood(t,nscen)
y_energy(t,nscen)
y_wood(t,nscen)
q_fertilizer(t,nscen)   output of sector producing intermediate input
q_landfert(t,nscen)
q_biofuel(t,nscen)
q_crop(t,nscen)
q_landfeed(t,nscen)
q_lvstk(t,nscen)
q_petroleum(t,nscen)
q_timber(t,nscen)
xFF_petroleum(t,nscen)  intermediate input used in more than one sector
xFF_fertilizer(t,nscen)
x_crop_food(t,nscen)
x_crop_biofuel(t,nscen)
x_crop_landfeed(t,nscen)
xE(j,t,nscen)

TFP(t)                  TFP in crops
RD(t)                   annual global R&D investment (in trillion of USD)
RDstock(t)
;


Equations
MaxRegretCon(nscen)
utility(t,nscen)           per capita AIDADS utility

fertilizer_q(t,nscen)      fertilizer sector output
landfert_q(t,nscen)        land-fertilizer composite output
crop_q(t,nscen)            crop sector output
landfeed_q(t,nscen)        land-feed composite output
lvstk_q(t,nscen)           livestock sector output
biofuels_q(t,nscen)        biofuels sector output
cropfood_y(t,nscen)        crop-based food sector output
lvstkfood_y(t,nscen)       lvstk-based food sector output
petroleum_q(t,nscen)       petroleum sector output
timber_q(t,nscen)          timber sector output
wood_y(t,nscen)            processed wood sector output
energy_y(t,nscen)          energy sector output

mc_crop(t,nscen)           market clearing condition for crop output
mc_extraction(t,nscen)     market clearing condition for extracted oil and gas
mc_E(t,nscen)              market clearing condition for other g&s

TFPvsRDstock(t)            map from US R&D stock to TFP
RDstockvsRD(t)             map from US R&D spending to R&D stock
StableRD(t)
;

MaxRegretCon(nscen)..                maxRegret =g= vv(nscen) - sum(t, discountFactor**((ord(t)-1)*deltat) * PiAll(t,nscen) * c(t,nscen)**(1-gamma)/(1-gamma));

utility(t,nscen)..   (alpha('cropfood')+beta('cropfood')*c(t,nscen))/(1+c(t,nscen))*log(y_cropfood(t,nscen)/PiAll(t,nscen) - sbsts('cropfood')) +
                                        (alpha('energy')+beta('energy')*c(t,nscen))/(1+c(t,nscen))*log(y_energy(t,nscen)/PiAll(t,nscen) - sbsts('energy')) +
                                        (alpha('wood')+beta('wood')*c(t,nscen))/(1+c(t,nscen))*log(y_wood(t,nscen)/PiAll(t,nscen) - sbsts('wood')) +
                                        (alpha('lvstkfood')+beta('lvstkfood')*c(t,nscen))/(1+c(t,nscen))*log(y_lvstkfood(t,nscen)/PiAll(t,nscen) - sbsts('lvstkfood')) +
                                        (alpha('E')+beta('E')*c(t,nscen))/(1+c(t,nscen))*log(y_other(t,nscen)/PiAll(t,nscen) - sbsts('E')) - log(c(t,nscen)) =e= kappa;

fertilizer_q(t,nscen)..     q_fertilizer(t,nscen) =e= q_0('fertilizer')*(share('fertilizer') * (xFF_fertilizer(t,nscen)/x_0('FF','fertilizer'))**rho('fertilizer') +
                                (1-share('fertilizer'))*(xE('fertilizer',t,nscen)/E_0j('fertilizer'))**rho('fertilizer'))**(1/rho('fertilizer'));

landfert_q(t,nscen)..       q_landfert(t,nscen) =e= q_0('landfert') * (share('landfert') * (L('C',t)/L_0('C'))**rho('landfert') +
                                (1-share('landfert')) * (q_fertilizer(t,nscen)/q_0('fertilizer'))**rho('landfert'))**(1/rho('landfert'));

crop_q(t,nscen)..           q_crop(t,nscen) =e= q_0('crop') * TFP(t) * (1-DamCoef*TAall(t,nscen)) *
                                (share('crop') * (q_landfert(t,nscen)/q_0('landfert'))**rho('crop') +
                                (1-share('crop')) * (xE('crop',t,nscen)/E_0j('crop'))**rho('crop'))**(1/rho('crop'));

landfeed_q(t,nscen)..       q_landfeed(t,nscen) =e= q_0('landfeed') * (share('landfeed') * (L('P',t)/L_0('P'))**rho('landfeed') +
                                (1-share('landfeed')) * (x_crop_landfeed(t,nscen)/(TFP(t) * x_0('crop','landfeed')))**rho('landfeed'))**(1/rho('landfeed'));

lvstk_q(t,nscen)..          q_lvstk(t,nscen) =e= q_0('lvstk') * TFP(t) * (share('lvstk') * (q_landfeed(t,nscen)/q_0('landfeed'))**rho('lvstk') +
                                (1-share('lvstk')) * (xE('lvstk',t,nscen)/E_0j('lvstk'))**rho('lvstk'))**(1/rho('lvstk'));

biofuels_q(t,nscen)..       q_biofuel(t,nscen) =e= q_0('biofuel') *
                                (share('biofuel') * (x_crop_biofuel(t,nscen)/x_0('crop','biofuel'))**rho('biofuel') +
                              (1-share('biofuel')) * (xE('biofuel',t,nscen)/E_0j('biofuel'))**rho('biofuel'))**(1/rho('biofuel'));

cropfood_y(t,nscen)..           y_cropfood(t,nscen) =e= theta('cropfood',t) * y_0('cropfood')*(share('cropfood') * (x_crop_food(t,nscen)/x_0('crop','cropfood'))**rho('cropfood') +
                                (1-share('cropfood'))*(xE('cropfood',t,nscen)/E_0j('cropfood'))**rho('cropfood'))**(1/rho('cropfood'));

lvstkfood_y(t,nscen)..      y_lvstkfood(t,nscen) =e= theta('lvstkfood',t) * y_0('lvstkfood')*(share('lvstkfood') * (q_lvstk(t,nscen)/q_0('lvstk'))**rho('lvstkfood') +
                                (1-share('lvstkfood'))*(xE('lvstkfood',t,nscen)/E_0j('lvstkfood'))**rho('lvstkfood'))**(1/rho('lvstkfood'));

petroleum_q(t,nscen)..      q_petroleum(t,nscen) =e= q_0('petroleum')*(share('petroleum') * (xFF_petroleum(t,nscen)/x_0('FF','petroleum'))**rho('petroleum') +
                                (1-share('petroleum'))*(xE('petroleum',t,nscen)/E_0j('petroleum'))**rho('petroleum'))**(1/rho('petroleum'));

timber_q(t,nscen)..         q_timber(t,nscen) =e= q_0('timber') * (share('timber') * (L('F',t)/L_0('F'))**rho('timber') +
                                (1-share('timber')) * (xE('timber',t,nscen)/E_0j('timber'))**rho('timber'))**(1/rho('timber'));

wood_y(t,nscen)..           y_wood(t,nscen) =e= theta('wood',t) * y_0('wood') * (share('wood') * (q_timber(t,nscen)/q_0('timber'))**rho('wood') +
                                (1-share('wood')) * (xE('wood',t,nscen)/E_0j('wood'))**rho('wood'))**(1/rho('wood'));

energy_y(t,nscen)..         y_energy(t,nscen) =e= theta('energy',t) * y_0('energy') * (share('energy') * (q_biofuel(t,nscen)/q_0('biofuel'))**rho('energy') +
                                (1-share('energy')) * (q_petroleum(t,nscen)/q_0('petroleum'))**rho('energy'))**(1/rho('energy'));


mc_extraction(t,nscen)..    xFF_fertilizer(t,nscen) + xFF_petroleum(t,nscen) =e= FF(t);

mc_crop(t,nscen)..          x_crop_food(t,nscen) + x_crop_biofuel(t,nscen) + x_crop_landfeed(t,nscen) =e= q_crop(t,nscen);

mc_E(t,nscen)..             sum(j, xE(j,t,nscen)) + y_other(t,nscen) + RD(t) =e=  Eall(t,nscen);


TFPvsRDstock(t)..     log(TFP(t)) =e= intercept + slope*log(RDstock(t));
RDstockvsRD(t)$(notT(t))..     RDstock(t+1) =e= sum(nlag$(ord(nlag)<=ord(t)), c_RD(nlag)*sum(t1$(ord(t1)=ord(t)+1-ord(nlag)), RD(t1))) +
                                                sum(nlag$(ord(nlag)>ord(t)), c_RD(nlag)*sum(nlag1$(ord(nlag1)=ord(nlag)-ord(t)), RD_hist(nlag1)));

StableRD(t)$(ord(t)<card(t))..          RD(t+1) =g= RD(t);

******************************
* bounds of variables

* level of inermidiate input must be greater than zero
xFF_fertilizer.lo(t,nscen) = epsilon;
xFF_petroleum.lo(t,nscen) = epsilon;
x_crop_food.lo(t,nscen) = epsilon;
x_crop_biofuel.lo(t,nscen) = epsilon;
x_crop_landfeed.lo(t,nscen) = epsilon;
xE.lo(j,t,nscen) = epsilon;

q_fertilizer.lo(t,nscen) = epsilon;
q_landfert.lo(t,nscen) = epsilon;
q_biofuel.lo(t,nscen) = epsilon;
q_crop.lo(t,nscen) = epsilon;
q_petroleum.lo(t,nscen) = epsilon;
q_timber.lo(t,nscen) = epsilon;
q_landfeed.lo(t,nscen) = epsilon;
q_lvstk.lo(t,nscen) = epsilon;

RD.lo(t) = 0.01;
TFP.lo(t) = epsilon;
RDstock.lo(t) = epsilon;

c.lo(t,nscen) = 0.001;

* per capita consumption greater than subsistance
y_cropfood.lo(t,nscen) = PiAll(t,nscen)*(sbsts('cropfood') + epsilon);
y_energy.lo(t,nscen) = PiAll(t,nscen)*(sbsts('energy') + epsilon);
y_wood.lo(t,nscen) = PiAll(t,nscen)*(sbsts('wood') + epsilon);
y_lvstkfood.lo(t,nscen) = PiAll(t,nscen)*(sbsts('lvstkfood') + epsilon);
y_other.lo(t,nscen) = PiAll(t,nscen)*(sbsts('E') + epsilon);

******************************
* fixed initial values and control variables

TFP.fx('1') = 1;
RDstock.fx('1') = RDstock0;

x_crop_biofuel.up(t,nscen) = x_0('crop','biofuel') * biof_index(t);

******************************
*** initial guess ************

q_fertilizer.l(t,nscen) = qs('fertilizer',t,nscen);
q_landfert.l(t,nscen) = qs('landfert',t,nscen);
q_biofuel.l(t,nscen) = qs('biofuel',t,nscen);
q_crop.l(t,nscen) = qs('crop',t,nscen);
q_petroleum.l(t,nscen) = qs('petroleum',t,nscen);
q_timber.l(t,nscen) = qs('timber',t,nscen);
q_landfeed.l(t,nscen) = qs('landfeed',t,nscen);
q_lvstk.l(t,nscen) = qs('lvstk',t,nscen);

x_crop_biofuel.l(t,nscen) = xs('crop','biofuel',t,nscen);
x_crop_food.l(t,nscen) = xs('crop','cropfood',t,nscen);
x_crop_landfeed.l(t,nscen) = xs('crop','landfeed',t,nscen);

*petroleum
xFF_petroleum.l(t,nscen) = xs('FF','petroleum',t,nscen);
xFF_fertilizer.l(t,nscen) = xs('FF','fertilizer',t,nscen);
xE.l(j,t,nscen) = xs('E',j,t,nscen);

* utility
c.l(t,nscen) = cs(t,nscen);

TFP.l(t) = TFPs(t,'4');
RD.l(t) = RDs(t,'4');

y_cropfood.l(t,nscen)  =  ys('cropfood',t,nscen);
y_energy.l(t,nscen)  =  ys('energy',t,nscen);
y_wood.l(t,nscen)  =  ys('wood',t,nscen);
y_lvstkfood.l(t,nscen)  =  ys('lvstkfood',t,nscen);
y_other.l(t,nscen) = Eall(t,nscen) - sum(j, xE.l(j,t,nscen)) - RD.l(t);

******************************


model MinMaxProblem /MaxRegretCon, utility,
fertilizer_q, landfert_q, crop_q, landfeed_q, lvstk_q, biofuels_q, petroleum_q, timber_q,
cropfood_y, wood_y, energy_y, lvstkfood_y,
mc_crop, mc_extraction, mc_E,
TFPvsRDstock, RDstockvsRD, StableRD /;


option solprint = off;

nnn = 0;
Repeat(
  nnn = nnn+1;
  solve MinMaxProblem minimizing maxRegret using nlp ;
until ((MinMaxProblem.MODELSTAT=2 and MinMaxProblem.SOLVESTAT=1) or nnn>=1000) );

option solprint = on;
solve MinMaxProblem minimizing maxRegret using nlp ;

******************************

*Output results

Parameters
per_capita_consumption(good,t,nscen) per capita consumption in 1000 2004 USD
growth_RD(t)            annual growth rate in one period
avg_growth_RD(t)        average annual growth rate since 2004
;

per_capita_consumption('cropfood',t,nscen) = y_cropfood.l(t,nscen)/PiAll(t,nscen);
per_capita_consumption('energy',t,nscen) = y_energy.l(t,nscen)/PiAll(t,nscen);
per_capita_consumption('wood',t,nscen) = y_wood.l(t,nscen)/PiAll(t,nscen);
per_capita_consumption('lvstkfood',t,nscen) = y_lvstkfood.l(t,nscen)/PiAll(t,nscen);
per_capita_consumption('E',t,nscen) = y_other.l(t,nscen)/PiAll(t,nscen);


growth_RD('1') = 0;
growth_RD(t+1) = (RD.l(t+1)/RD.l(t))**(1/deltat) - 1;
avg_growth_RD('1') = 0;
avg_growth_RD(t+1) = (RD.l(t+1)/RD.l('1'))**(1/(ord(t)*deltat)) - 1;


**********************************
* Compute regrets

parameters vv3(nscen)
        regret2(nscen,nscen2)
        regret3(nscen)
        maxreg
        regret_ceq2(nscen,nscen2)       regret measured with present value of flow of global loss of consumption aggragator (billion USD), using nscen decision when nscen2 is realized
        regret_ceq3(nscen)              regret measured with present value of flow of global loss of consumption aggragator (billion USD), using MMR decision when nscen is realized
        r_ceq(t,nscen)                  annual interest rates for ceq
        discount_ceq(t,nscen)           discount using interest rates for ceq
        ceq_yo(t,nscen)                 partial derivative of ceq over y^o
        regret_USD2(nscen,nscen2)       regret measured with present value of global loss (in real market billion USD), using nscen decision when nscen2 is realized
        regret_USD3(nscen)              regret measured with present value of global loss (in real market billion USD), using MMR decision when nscen is realized
        r(t,nscen)                      annual interest rates
        discount(t,nscen)               discount using interest rates
;
vv3(nscen) = sum(t$(ord(t)<=NumRegret), discountFactor**((ord(t)-1)*deltat) * PiAll(t,nscen) * c.l(t,nscen)**(1-gamma)/(1-gamma));
regret2(nscen,nscen2) = vv2(nscen2,nscen2) - vv2(nscen,nscen2);
regret3(nscen) = vv2(nscen,nscen) - vv3(nscen);

r_ceq(t,nscen)$(notT(t)) = (c.l(t,nscen)**(-gamma)/(discountFactor**deltat * c.l(t+1,nscen)**(-gamma)))**(1/deltat) - 1;
discount_ceq(t,nscen) = 1;
loop(t$(ord(t)>1),
  discount_ceq(t,nscen) = discount_ceq(t-1,nscen)/((1+r_ceq(t-1,nscen))**deltat);
);


regret_ceq2(nscen,nscen2) = 1000*deltat*sum(t$(ord(t)<=NumRegret), (cs2(t,nscen2,nscen2)-cs2(t,nscen,nscen2))*PiAll(t,nscen2)*discount_ceq(t,nscen2));
regret_ceq3(nscen) = 1000*deltat*sum(t$(ord(t)<=NumRegret), (cs2(t,nscen,nscen) - c.l(t,nscen))*PiAll(t,nscen)*discount_ceq(t,nscen));


ceq_yo(t,nscen) = ( (alpha('E')+beta('E')*c.l(t,nscen))/(per_capita_consumption('E',t,nscen)-sbsts('E')) ) /
                ( log(c.l(t,nscen)) + 1 + 1/c.l(t,nscen) - sum(good, beta(good)*log(per_capita_consumption(good,t,nscen)-sbsts(good))) + kappa );
r(t,nscen)$(notT(t)) = (c.l(t,nscen)**(-gamma)*ceq_yo(t,nscen) / (discountFactor**deltat * c.l(t+1,nscen)**(-gamma) * ceq_yo(t+1,nscen)))**(1/deltat) - 1;
discount(t,nscen) = 1;
loop(t$(ord(t)>1),
  discount(t,nscen) = discount(t-1,nscen)/((1+r(t-1,nscen))**deltat);
);

regret_USD2(nscen,nscen2) = 1000*deltat*sum(t$(ord(t)<=NumRegret), (cs2(t,nscen2,nscen2)-cs2(t,nscen,nscen2))/ceq_yo(t,nscen2) *PiAll(t,nscen2)*discount(t,nscen2));
regret_USD3(nscen) = 1000*deltat*sum(t$(ord(t)<=NumRegret), (cs2(t,nscen,nscen) - c.l(t,nscen))/ceq_yo(t,nscen) *PiAll(t,nscen)*discount(t,nscen));

display ceq_yo, r_ceq, r;

