$include RandD_det.gms

* The following is added by Yongyang Cai

** Start Exogenous Projections**************************************************

$include RandD_SSPs.gms

*Output results

Parameter
year(t);
year(t) = 2004 + deltat *(ord(t)-1);

File resSSP /res_SSPs.csv/;
resSSP.pc=5;
resSSP.pw=4000;

Put resSSP;
loop(nscen,
Put "R&D Spending (annual global trillion USD)";
Loop (t, put RDs(t,nscen) ::4);
put /;

Put "R&D stock";
Loop (t, put RDstocks(t,nscen) ::4);
put /;

Put "TFP";
Loop (t, put TFPs(t,nscen) ::4);
put /;

);


*********************

$include MMR_SSP.gms

*Output results

File resMMRSSP /res_MMR_SSP.csv/;
resMMRSSP.pc=5;
resMMRSSP.pw=4000;

Put resMMRSSP;
Put "R&D Spending (annual global trillion USD)";
Loop (t, put RD.l(t) ::4);
put /;

Put "TFP";
Loop (t, put TFP.l(t) ::4);
put /;

Put "annual growth of R&D Spending in one period";
Loop (t, put growth_RD(t) ::4);
put /;

Put "average annual growth of R&D Spending since 2004";
Loop (t, put avg_growth_RD(t) ::6);
put /;


File regretSSP /regret_SSP.csv/;
regretSSP.pc=5;
regretSSP.pw=4000;

Put regretSSP;
put "regret measured with present value of flow of global loss (in real market billion USD)" /;
put "Model \ Realized";
put "SSP1";
put "SSP2";
put "SSP3";
put "SSP4";
put "SSP5";
put "max regret" /;

Loop (nscen,
  put "Action for one SSP";
  loop( nscen2, put regret_USD2(nscen,nscen2) ::6 );
  maxreg = smax(nscen2, regret_USD2(nscen,nscen2));
  put maxreg ::6;
  put /;
);
put "Action for MMR";

loop(nscen, put regret_USD3(nscen) ::6 );
maxreg = smax(nscen, regret_USD3(nscen));
put maxreg ::6;
put /;


