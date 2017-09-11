The model copyright belongs to Yongyang Cai (cai.619@osu.edu), Alla Golub (golub@purdue.edu) and Thomas Hertel (hertel@purdue.edu).

When using this code, please cite the following paper:

Cai, Y., A.Golub, and T.Hertel. Agricultural research spending must increase in light of future uncertainties (2017). Food Policy (70):71-83. https://doi.org/10.1016/j.foodpol.2017.06.002



Economic partial equilibrium model of global land use with endogenous agricultural R&D spending and Total Factor Productivity (TFP) is coded in RandD_det.gms.

This economic model is used in Minimize Maximum Regret (MMR) procedure. 

Specifically, MMR_RandD_SSP.gms finds optimal R&D spending path and TFP for each of the five SSP scenarios, along with valuation of those regrets associated with wrong investment decisions. 
Then, the maximum regret is minimized to find a robust optimal R&D pathway that factors in uncertainties in future population, income and global surface temperature, and the long lag in productivity response to R&D.

The regrets generated with these files are slightly different from those presented in the Food Policy paper due to some changes in exogenous trends.


