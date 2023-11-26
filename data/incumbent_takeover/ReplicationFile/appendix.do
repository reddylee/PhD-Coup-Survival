
************************************************************************************************************************************************************************************************************
*                                       Appendix to                                         *       *    Baturo and Tolstrup   - Incumbent Takeovers -  Journal of Peace Research         STATA 12.1                          *                                                                             *************************************************************************************************************************************************************************************************************


clear

/*************************************************/
/* Figure 1: Time Coverage by Various Indicators */
/*************************************************/



use appendix/indicators
gsort -rank
sencode indicator, gen(indicator2)
gsort -indicator2

   twoway (rbar starty endy indicator2, horizontal barwidth(.001) bcolor(gs1) ), ///
   ylabel(1(1)13, labsize(small) valuelabel  angle(0))  ytitle("") ///
  xlabel(1920(10)2020) scheme(s1mono) xtitle("") xlabel( , labsize(small) angle(45)) legend(off) xsize(8) ysize(5) graphr(m(l-1 ))

graph export appendix/indicators.pdf, replace

clear 


/*******************************************************/
/* Figure 2: Differences in takeover estimates (years) */
/*******************************************************/


use estimation_file

/* takediff.pdf for all regimes */
hist  diff if num_indicator!=1, percent width(1) start(0) xtitle("Takeover Estimates, Differences in Years") ///
 start(0) ytitle("Percent" "of leaders", ///
) ylabel(0(5)35, angle(0)) xlabel(0(2)15) scheme(s1mono) plotr(m(l-2 r+2)) 

graph export appendix/takediff.pdf, replace


/*******************************************************/
/* Figure 3: Takeover Events, 1918Ð2019 */
/*******************************************************/
/* Code in appendix/map_appendix.R to produce Figure 3 */ 



/*******************************************************/
/* Figure 4: Time from entry into office */
/*******************************************************/


/* timeto.pdf for all regimes */
hist  timeto if timeto<20, percent width(1) start(0) xtitle("Time to Takeover, Years from Entry into Office") ///
 start(0) ytitle("Percent" "of leaders", ///
) ylabel(0(5)25, angle(0)) xlabel(0(2)16) scheme(s1mono) plotr(m(l-2 r+2)) 

graph export appendix/timeto.pdf, replace


/***********************************************/
/*   Table 1 Descriptive Stats                  */
/***********************************************/

tabstat tenure, stats(mean, sd)
tabstat tenure if endy!=2019, stats(mean sd min max)
tabstat tenure if entrydem==1, stats(mean sd min)
tabstat tenure if entrydem==0, stats(mean sd max)
tabstat timeto, stats(mean sd)
tabstat timeto if entrydem==1, stats(mean sd min max)
tabstat timeto if entrydem==0, stats(mean sd min max)

tabstat diff if num_indicator!=1, stats(mean, sd)
tabstat diff if entrydem==1 & num_indicator!=1, stats(mean sd )
tabstat diff if entrydem==0 & num_indicator!=1, stats(mean sd)

/**************************************************/
///***     summary stats for discussion in text   ***///
/*******************************************************/

gen takeover=1
recode year1 (1920/1929=1920) (1930/1939=1930) (1940/1949=1940) (1950/1959=1950) (1960/1969=1960) (1970/1979=1970) (1980/1989=1980) (1990/1999=1990) (2000/2009=2000) (2010/2019=2010), gen(decade)
tabstat takeover, by(decade) stats(n)

bysort year: egen yeartakeover=sum(takeover)
tabstat yeartakeover, stats(mean median n)

tabstat takeover if entrydem==1, by(decade) stats(n)





/*************************************************************/
///***    Figure 5: Takeovers Over Time: 3 subplots ***/
/*************************************************************/


/**************************************************/
/*             over time      VDEM                */
/*******************************************************/

clear 
use estimation_file
gen takeover=1
 gen dem0=takeover if v2x_regime==0
gen dem1=takeover if v2x_regime==1
 gen dem2=takeover if v2x_regime==2 | v2x_regime==3
 
/* gen dem3=takeover if v2x_regime==3  only two cases */


by year1, sort: egen dem0y=sum(dem0)
by year1, sort: egen dem1y=sum(dem1)
by year1, sort: egen dem2y=sum(dem2)


graph twoway  lowess dem0y year1, lpattern(solid) lcolor(black) || lowess dem1y year1, lpattern(shortdash) ///
lcolor(black) lwidth(medium) ///
|| lowess dem2y year1 , lpattern(solid)  lwidth(thin) lcolor(red) ///
|| line dem0y year1, lpattern(solid)  lwidth(vthin) lcolor(gs12)  ///
|| line dem1y year1, lpattern(dash)  lwidth(vthin)  lcolor(gs12) ///
|| line dem2y year1, lpattern(dash)  lwidth(vvthin)  lcolor(red) ///
xlabel(1920(10)2020, valuelabel angle(45)) ///
ylabel(0(1)6, valuelabel angle(360)) ///
plotregion(margin(r+1 t+0.5)) ///
xtitle("Year") ytitle("Takeover")   scheme(s1mono) ///
legend(order(1 2 3) label(1 "Closed autocracy") label(2 "Electoral autocracy") ///
 label(3 "Electoral democracy")  ///
             size(small) region(lstyle(none)))


graph export appendix/timeline_vdem.pdf, replace


   /*****************************************************************/
///***            over time   BMR                     ***///
/*****************************************************************/


gen dddem=takeover if e_boix_regime==1
gen ddnodem=takeover if e_boix_regime==0
by year1, sort: egen dddemy=sum(dddem)
by year1, sort: egen ddnodemy=sum(ddnodem)


graph twoway  lowess dddemy year1 , lpattern(solid) || ///
lowess ddnodemy year1 , lpattern(shortdash) ///
lcolor(black) lwidth(medium) ///
|| line dddemy year1 , lpattern(solid)  lwidth(thin) lcolor(gs12)  ///
 || line ddnodemy year1 , lpattern(shortdash) lcolor(gs12) ///
xlabel(1920(5)2010, valuelabel angle(45)) ///
ylabel(0(1)6, valuelabel angle(360)) ///
plotregion(margin(r+1 t+0.5)) ///
xtitle("Year") ytitle("Takeover")   scheme(s1mono) ///
legend(order(2 1) label(1 "Democracy") label(2 "Dictatorship") ///
             size(small) region(lstyle(none)))

graph export appendix/timeline_bmr.pdf, replace


/*******************************************/
/* Overtime in dem and nodem per N states */
/*******************************************/


clear
use estimation_file
replace year=year1
sort year
merge year using appendix/statenum, nokeep
drop _merge
save estimation_file, replace
gen takeover=1

gen takeoverdem=1 if entrydem==1
gen takeovernodem=1 if entrydem==0
bysort year1: egen numeventsdem=sum(takeoverdem)
bysort year1: egen numeventsnodem=sum(takeovernodem)
gen numeventsdem2=(numeventsdem/statenum)*100
gen numeventsnodem2=(numeventsnodem/statenum)*100            

graph twoway  lowess numeventsnodem2 year1,  lpattern(solid) lcolor(black) ///
|| lowess numeventsdem2 year1, lpattern(dash)  lwidth(thin) lcolor(black) ///
|| line numeventsnodem2 year1, lpattern(solid)  lwidth(vthin) lcolor(gs12)  ///
|| line numeventsdem2 year1, lpattern(dash)  lwidth(vthin)  lcolor(gs12) ///
xlabel(1920(10)2020, valuelabel angle(45)) ///
ylabel(0(2)8, valuelabel angle(360)) ///
plotregion(margin(r+1 t+0.5))  xsize(8) ysize(5) ///
xtitle("Year") ytitle("Per cent of events per number of states")   scheme(s1mono) legend(order(1 2) ///
 label(1 "Nondemocratic")  label(2 "More democratic at entry") ///             size(vsmall) region(lstyle(none)))

graph export appendix/timeline_dem_nodem_statenum.pdf, replace




/**************************************************/
///***   Table 2: FH recodes in appendix   */  ***///
/*******************************************************/

clear
use Figure2/fh2020
egen timein=concat(starty endy), punct(-)
egen rulertime=concat(ruler timein), punct(" (")
egen rulercountry=concat(rulertime country), punct("), ")
sort change year rulercountry
listtex rulercountry year change if reason2=="concentration of power"   using appendix/table2.tex, replace end(\\) missnum(--)



  /**************************************************/
///***    Table 3: GWF recodes in appendix*/  ***///
/*******************************************************/

clear
use estimation_file
sort country year1
listtex rulercountry  gwfstart gwfend gwf if gwf!=gwfstart & gwf!=starty using appendix/table3.tex, replace end(\\) missnum(--)



  /**************************************************/
///***    Table 4: PRW recodes in appendix*/  ***///
/*******************************************************/

clear
use appendix/rulers_prw

/* egen timein=concat(starty endy), punct(-)
egen rulertime=concat(ruler timein), punct(" (")
egen rulercountry=concat(rulertime country), punct("), ") */

listtex rulercountry year1 year2 bigwhy  using appendix/table4.tex, replace end(\\) missnum(--)



/***********************************************/
///***  Table 5:  types of takeovers          ***///
/***********************************************/  
 
clear
use estimation_file

/* Table of takeovers */
tab bigwhy , sort
tab bigwhy if entrydem==1, sort
tab bigwhy if  entrydem==0, sort

tab gwf_regimetype if  entrydem==1
tab gwf_regimetype if  entrydem==0

/***********************************************************/
///***  Figure 6: Type of Takeover                        *///
/************************************************************/ 
/* Main categories of takeovers, (no more than one event per leader */


/*takeover_leaders_cats */
gen democ=1 if entrydem==1 
gen nodemoc=1 if entrydem==0

graph hbar (sum) nodemoc democ, over(bigwhy, sort(1) label(labsize(small)) ) ///   bargap(-10)  ylabel(0(10)40, labsize(small) angle(0))  ///               scheme(s1mono) bar(1,color(black)) bar(2,color(gs11))  ///
               graphregion(margin(l+2 )) ///             legend(order(1 2) label(1 "Nondemocratic") label(2 "More democratic at entry") ///             size(vsmall) region(lstyle(none))) 

graph export appendix/takeover_leaders_cats.pdf, replace


/***********************************************************/
///***  Figure 7: Difference in Power Concentration Scores *///
/***********************************************************/ 

clear
use appendix/takeovers_scales

hist xconst_diff2, percent width(0.5) xtitle("Executive Constraints (XCONST)") scheme(s1mono)
graph export appendix/xconst_diff.pdf, replace 
hist v2x_horacc_diff2, percent width(0.25)  xtitle("Horizontal Accountability") scheme(s1mono) 
graph export appendix/horacc_diff.pdf, replace 
hist v2xnp_pres_diff2, percent width(0.1) start(-0.2) xtitle("Presidentialism, Systemic Concentration of Political Power") scheme(s1mono) 
graph export appendix/pres_diff.pdf, replace
hist polconiii_diff2, percent width(0.1) xtitle ("Political Constraints (Polcon III)") scheme(s1mono) 
graph export appendix/polcon_diff.pdf, replace


 /*****************************************************************************/
///***   Figure 8: Changes in Power and Prior Power Concentration Scores      ***///
/**********************************************************************************/

clear
use appendix/takeovers_scales

graph box xconst_diff2 if y_1_xconst!=1, over(y_1_xconst) ytitle("Change in Constraints") ///
b1title("Prior Executive Constraints (XCONST)") scheme(s1mono)
graph export appendix/xconst_distances.pdf, replace

tabstat y_1_v2x_horacc, stats(min p25 p50 p75 max)

gen horacc_4parts=1 if y_1_v2x_horacc<-.809 & y_1_v2x_horacc!=.
replace horacc_4parts=2 if y_1_v2x_horacc>=-.809 & y_1_v2x_horacc!=.
replace horacc_4parts=3 if y_1_v2x_horacc>=-.349 & y_1_v2x_horacc!=.
replace horacc_4parts=4 if y_1_v2x_horacc>=.154 & y_1_v2x_horacc!=.

graph box v2x_horacc_diff2, over(horacc_4parts, relabel(1 "min-p25" 2 "p25-p50" 3 "p50-p75" 4 "p75-max")) ///
b1title("Prior Horizontal Accountability") ytitle("Change in Accountability") ///
marker(1, msymbol(none) mlabel( ruler)) scheme(s1mono)
graph export appendix/horacc_distances.pdf, replace


 /**********************************************************************************/
///* Figure 9: Difference in Power Concentration Scores, Different Takeover Events */
 /**********************************************************************************/

clear
use appendix/takeovers_scales

graph hbar (mean) v2x_horacc_diff2, over(bigwhy, sort(1) label(labsize(small)) ) ///
ytitle("Average Change in Horizontal Accountability") scheme(s1mono)
graph export appendix/horacc_cats.pdf, replace

graph hbar (mean) xconst_diff2, over(bigwhy, sort(1) label(labsize(small)) ) ///
ytitle("Average Change in Executive Constraints") scheme(s1mono)
graph export appendix/xconst_cats.pdf, replace




/************************************************************************/
///***   Table 6: Incumbent Takeovers, Autogolpes, Tenure Extensions */  ***///
/*****************************************************************************/

clear
use estimation_file

/*egen timein=concat(starty endy), punct(--)
egen rulertime=concat(ruler timein), punct(" (")
egen rulercountry=concat(rulertime country), punct("), ") */


/* X stands for an agreement b/w two indicators */
gen year22=year2 if year2!=year1
gen x="x" if year22!=.
replace x="--" if x==""
sort country year1
/* time in office label */
gen year2b=year2
replace year2b=year2-1900 if year2<2000
replace year2b=year2-2000 if year2>1999
replace year2b=2000 if year2b==0
gen year1b=year1
tostring year1b, gen(when1)
egen when2=concat(year1 year2b) if year2!=year1, punct("--") 
replace when2=when1 if when2==""


listtex rulercountry when2 autogolpe_powell pacl autocoups_pipe agcoup_marshall inc_svolik haggard baturo neldaterm dd_incumb fh vdem gwf prw1 x    using appendix/table6.tex, replace end(\\) missnum(--)

clear



/***********************************************/
///**                 Figure descriptive all  ***************/
 /***********************************************/  


clear
use estimation_file

gsort -starty
sencode rulercountry , gen(ruler2)
gen order=0 in 1/55
replace order=1 in 56/110
replace order=2 in 111/166
replace order=3 in 167/222
replace order=4 in 223/279

replace year1=minyear
replace year2=maxyear


/* when takeover is same year as endyear, not visible in figure, make 3months in black for visualisation */
gen year11=year1
replace year11=1992.7 if ruler=="Serrano Elias"
replace year11=2011.7 if ruler=="Tadic"
replace year11=2004.7 if ruler=="Kumaratunga"
replace year11=1976.7 if ruler=="Bandaranaike, S"
replace year11=1978.7 if ruler=="Taraki"
replace year11=1955.7 if ruler=="Chaudhri M. Ali"
replace year11=1957.3 if ruler=="Fignole"
replace year11=1963.7 if ruler=="Paz Estenssoro"
replace year11=1967.7 if ruler=="Robles"
replace year11=1939.7 if ruler=="Estigarribia"
replace year11=1947.7 if ruler=="Higinio Morinigo"
replace year11=1950.7 if ruler=="Urriolagoitia"

replace year11=1974.7 if ruler=="Mujib Rahman"
replace year11=1962.7 if ruler=="L. Somoza"
replace year11=1950.7 if ruler=="Arias, A."
replace year11=1944.7 if ruler=="la Guardia"
replace year11=1934.7 if ruler=="Velasco Ibarra"
replace year11=1929.7 if ruler=="Liles"
replace year11=1924.7 if ruler=="Saavedra"
replace year11=1925.7 if ruler=="Orellana"
replace year11=1923.7 if ruler=="Lopez Gutierrez"
replace year11=1918.7 if ruler=="Bertrand"



   twoway (rbar starty endy ruler2 if order==0, horizontal barwidth(.4) bcolor(gs14) ) ///
  (rbar year11 endy ruler2 if order==0, horizontal barwidth(.4) bcolor(gs1)) ///
    (rbar year2 endy ruler2 if order==0 & year11!=year2, horizontal barwidth(.4) ), ///
   ylabel(2(1)55, labsize(tiny) valuelabel alternate angle(0))  ytitle("") ///
  xlabel(1990(10)2020, grid)  xlabel( , labsize(small)) legend(off) xsize(10) ysize(8) graphr(m(l-3 ))
graph export appendix/describe1.pdf, replace

  
   twoway (rbar starty endy ruler2 if order==1, horizontal barwidth(.4) bcolor(gs14) ) ///
  (rbar year11 endy ruler2 if order==1, horizontal barwidth(.4) bcolor(gs1)) ///
    (rbar year2 endy ruler2 if order==1 & year11!=year2, horizontal barwidth(.4) ), ///
   ylabel(56(1)110, labsize(tiny) valuelabel alternate angle(0))  ytitle("") ///
  xlabel(1980(10)2010, grid)  xlabel( , labsize(small)) legend(off) xsize(10) ysize(8) graphr(m(l-3 ))
graph export appendix/describe2.pdf, replace

    twoway (rbar starty endy ruler2 if order==2, horizontal barwidth(.4) bcolor(gs14) ) ///
  (rbar year11 endy ruler2 if order==2, horizontal barwidth(.4) bcolor(gs1)) ///
    (rbar year2 endy ruler2 if order==2 & year11!=year2, horizontal barwidth(.4) ), ///
   ylabel(111(1)166, labsize(tiny) valuelabel alternate angle(0))  ytitle("") ///
  xlabel(1960(10)2010, grid)  xlabel( , labsize(small)) legend(off) xsize(10) ysize(8) graphr(m(l-3 ))
graph export appendix/describe3.pdf, replace

    twoway (rbar starty endy ruler2 if order==3, horizontal barwidth(.4) bcolor(gs14) ) ///
  (rbar year11 endy ruler2 if order==3, horizontal barwidth(.4) bcolor(gs1)) ///
    (rbar year2 endy ruler2 if order==3 & year11!=year2, horizontal barwidth(.4) ), ///
   ylabel(167(1)222, labsize(tiny) valuelabel alternate angle(0))  ytitle("") ///
  xlabel(1950(10)2000, grid)  xlabel( , labsize(small)) legend(off) xsize(10) ysize(8) graphr(m(l-3 ))
graph export appendix/describe4.pdf, replace


    twoway (rbar starty endy ruler2 if order==4, horizontal barwidth(.4) bcolor(gs14) ) ///
  (rbar year11 endy ruler2 if order==4, horizontal barwidth(.4) bcolor(gs1)) ///
    (rbar year2 endy ruler2 if order==4 & year11!=year2, horizontal barwidth(.4) ), ///
   ylabel(223(1)279, labsize(tiny) valuelabel alternate angle(0))  ytitle("") ///
  xlabel(1920(10)1970, grid)  xlabel( , labsize(small)) legend(off) xsize(10) ysize(8) graphr(m(l-3 ))
graph export appendix/describe5.pdf, replace
 


