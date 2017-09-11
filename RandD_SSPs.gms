* written by Yongyang Cai

slope = sum(ee$(ord(ee)=(1+card(ee))/2), slopes(ee));
intercept = sum(ee$(ord(ee)=(1+card(ee))/2), intercepts(ee));


Parameters
vv2(nscen,nscen2)   welfare using solution for nscen when realization is nscen2
cs2(t,nscen,nscen2)
vv(nscen)
cs(t,nscen)
qs(i,t,nscen)       output of sector producing intermediate input
ys(good,t,nscen)    output of sector producing final consumption good
xs(allgoods,j,t,nscen) intermediate input used in more than one sector
TFPs(t,nscen)       TFP in crops
RDs(t,nscen)        annual global R&D investment (in trillion of USD)
RDstocks(t,nscen)
;

option solprint = off;

loop(nscen,
  Pi(t) = PiAll(t,nscen);
  E(t) = Eall(t,nscen);
  TA(t) = TAall(t,nscen);


* per capita consumption greater than subsistance
  y1.lo(good,t) = Pi(t)*(sbsts(good) + epsilon);

  TFP1.fx('1') = 1;
  RDstock1.fx('1') = RDstock0;

  RD1.l(t) = E(t)*0.001;

  tstart = 1;

  nnn = 0;
  Repeat(
    nnn = nnn+1;
    solve welf1 using nlp maximizing big_u1;
  until ((welf1.MODELSTAT=2 and welf1.SOLVESTAT=1) or nnn>=10) );

  loop(t$(ord(t)>=tstart and ord(t)<card(t)),
    if(RD1.l(t+1) < RD1.l(t),
      RD1.l(t+1) = RD1.l(t);
    );
  );
  nnn = 0;
  Repeat(
    nnn = nnn+1;
    solve welf1 using nlp maximizing big_u1;
  until ((welf1.MODELSTAT=2 and welf1.SOLVESTAT=1) or nnn>=10) );

  solve welf1 using nlp maximizing big_u1;
  ABORT$(welf1.MODELSTAT <> 2) "Model not normally completed";
  ABORT$(welf1.SOLVESTAT <> 1) "No local optimum found";

  vv(nscen) = big_u1.l;

  loop(restartStage,
    tstart = restartStage.val;

    RDs(t,nscen)$(ord(t)<=tstart) = RD1.l(t);
    RDstocks(t,nscen)$(ord(t)<=tstart) = RDstock1.l(t);

    RD1.fx(t)$(ord(t)<=tstart) = RDs(t,nscen);
    RDstock1.fx(t)$(ord(t)<=tstart) = RDstocks(t,nscen);

    nnn = 0;
    Repeat(
      nnn = nnn+1;
      solve welf1 using nlp maximizing big_u1;
    until ((welf1.MODELSTAT=2 and welf1.SOLVESTAT=1) or nnn>=10) );

    solve welf1 using nlp maximizing big_u1;
    ABORT$(welf1.MODELSTAT <> 2) "Model not normally completed";
    ABORT$(welf1.SOLVESTAT <> 1) "No local optimum found";
  );

  TFPs(t,nscen) = TFP1.l(t);
  RDs(t,nscen) = RD1.l(t);
  RDstocks(t,nscen) = RDstock1.l(t);

  cs(t,nscen) = c1.l(t);
  qs(i,t,nscen) = q1.l(i,t);
  ys(good,t,nscen) = y1.l(good,t);
  xs(allgoods,j,t,nscen) = x1.l(allgoods,j,t);

*****************
* compute regrets
*****************
  loop(nscen2,
    Pi(t) = PiAll(t,nscen2);
    E(t) = Eall(t,nscen2);
    TA(t) = TAall(t,nscen2);


* resolve the optimization problem with the fixed RD but different realized scenario
    RD1.fx(t) = RDs(t,nscen);
    RDstock1.fx(t) = RDstocks(t,nscen);
    y1.lo(good,t) = Pi(t)*(sbsts(good) + epsilon);

    tstart = 1;

    nnn = 0;
    Repeat(
      nnn = nnn+1;
      solve welf1 using nlp maximizing big_u1;
    until ((welf1.MODELSTAT=2 and welf1.SOLVESTAT=1) or nnn>=10) );

    solve welf1 using nlp maximizing big_u1;
    ABORT$(welf1.MODELSTAT <> 2) "Model not normally completed";
    ABORT$(welf1.SOLVESTAT <> 1) "No local optimum found";

    vv2(nscen,nscen2) = sum(t$(ord(t)<=NumRegret), discountFactor**((ord(t)-1)*deltat) * Pi(t) * c1.l(t)**(1-gamma)/(1-gamma));
    cs2(t,nscen,nscen2) = c1.l(t);
  );


* cancel the constraints of fixed RD
  RD1.lo(t) = epsilon;
  RD1.up(t) = 10000;
  RDstock1.lo(t) = epsilon;
  RDstock1.up(t) = 100000;
);
