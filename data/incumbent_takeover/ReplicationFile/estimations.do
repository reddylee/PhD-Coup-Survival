
************************************************************************************************************************************************************************************************************
*            Alexander Baturo and Jakob Tolstrup - Incumbent Takeovers                     *       *                    Journal of Peace Research         STATA 12.1                          *                                                                             *************************************************************************************************************************************************************************************************************clear 
/*************************************************/
/*************************************************/
/* Figure 2 reasons for Freedom House downgrades */
/*************************************************/
/*************************************************/


/* this do-file categorizes FH downgrades and makes fh_cats dataset for Figure 2 */

do Figure2/dembreak_list2020.do

use Figure2/fh_cats

label define changecats 1 "coup d'etat" 2 "concentration of power" 3 "insurgency and conflict" ///
4 "civil rights violations" 5 "delayed/disputed election" 6 "crime or corruption"  7 "numerous reasons"
label values changecats changecats


gen depvar0=fpftonf
gen depvar1=ftopf

gen depvar2 = -depvar1graph hbar (asis) depvar0 depvar2,  ///     over(changecats,  label(labsize(small))) ///     ylabel(   -20 "20" -10 "10" 0 "0" ///            10 "10" 20 "20" 30 "30", labsize(vsmall)) ///             bargap(-100)  ysize(4) xsize(5) scheme(s1mono) bar(1,color(black)) ///             legend(order(2 1) label(1 "from PF/F to NF") label(2 "from F to PF") ///             size(small) region(lstyle(none))) 
graph export Figure2/freedomhouse_cats.pdf, replace

clear


/*************************************************************************************/
/* create estimation_file with time to takeover and interval indicators per leader */
/*************************************************************************************/


use rulers_takeovers

/* use baturo ptl year if same ptl change */
gen neldaonly= neldaterm if neldaterm!=. & baturo==.
/* use gwf or dd_incumb if not from entry into office */
gen gwfdiff=gwf if gwf!=starty
gen dd_diff=dd_incumb1 if dd_incumb1!=starty

egen minyear=rowmin(neldaonly baturo pacl autocoups_pipe agcoup_marshall inc_svolik autogolpe_powell haggard fh vdem gwfdiff dd_diff prw1) 
/* add first year of gwf spell if no other indicartor is available */
replace minyear=gwf if minyear==. & gwf!=. 

/* replace minyear to gwf as ptl changes only occur after cold war, long spells */
replace minyear=1986 if ruler=="Museveni"
replace minyear=1978 if ruler=="Saleh"
replace minyear=1972 if ruler=="Kerekou"

/* gen timeto=minyear-starty */
replace timeto=minyear-starty  
egen maxyear=rowmax(neldaonly baturo baturo2 pacl autocoups_pipe agcoup_marshall inc_svolik autogolpe_powell haggard fh vdem dd_incumb2  gwf prw2)

/* difference in estimates when there are at least 2 sources per leader, excl over 16 years */
/* e.g., (SSA leaders who did takeoevers twice, before and after 1991 */
/* gen diff=maxyear-minyear */
replace diff=maxyear-minyear

/* 2008 is endpoint in CGV, recode to 1992 */
replace maxyear=1992 if ruler=="Dos Santos"
/* 2008 is the last year in CGV, meaningful to refer to tl removal */
replace maxyear=2004 if ruler=="Lukashenko"
/* 2008 is tl after cold war, replace to first gwf year */
replace maxyear=1983 if ruler=="Biya"
/* 1952 is tl change via placeholder, no events prior */
replace maxyear=1930 if ruler=="Trujillo"
/* 1992 is tl change, takeover is accomplished prior */
replace maxyear=1982 if ruler=="Gouled"
/* 2005 tl change, 1968 is from vdem */
replace maxyear=1968 if ruler=="Bongo"
/* 2006 tl change, 1995 is from cgv */
replace maxyear=1995 if ruler=="Conte"
/* 1962 is end of regime spell after ruler's tenure */
replace maxyear=1950 if ruler=="Magloire"
/* 1948 is nelda election, 1936 vdem */
replace maxyear=1936 if ruler=="Carias"
/* 2008 is endpoint in CGV, recode to 1998 tl change */
replace maxyear=1998 if ruler=="Nazarbaev"
/* 1984 is endpoint in CGV, recode to 1970 when all agree */
replace maxyear=1970 if ruler=="Jonathan"
/* 1977 is 2nd tl change, revert to 1967 tl change */
replace maxyear=1967 if ruler=="Stroessner"
/* 2008 is endpoint in CGV, recode to 1987 takeover */
replace maxyear=1987 if ruler=="Mugabe"
/* 2006 is late tl change, in control from 1986, no other indicator */
replace maxyear=1986 if ruler=="Museveni"
/* 2001 is late tl change, in control from 1978, no other indicator */
replace maxyear=1978 if ruler=="Saleh"
/* 1983 is nelda election, 1973 from pacl */
replace maxyear=1973 if ruler=="Kaunda"
/* 2005 is 2nd tl change, refer to 1998 first tl */
replace maxyear=1998 if ruler=="Campaore"
replace maxyear= prw2 if prw2==. & maxyear==.
replace year2= prw2 if prw2!=.
replace maxyear=prw1 if  prw2==. & maxyear==.
replace diff=maxyear-minyear
/* number of events per leader */
egen num_indicator=rownonmiss(neldaterm baturo pacl autocoups_pipe agcoup_marshall inc_svolik autogolpe_powell haggard fh vdem gwf dd_incumb1 prw1)

drop dd_diff gwfdiff neldaonly
replace year1=minyear
replace year2=maxyear

save estimation_file, replace


/*******************************************/
/* more and less democratic at entry      */
/*******************************************/

gen entrydem=.
replace entrydem=0 if entrypolity<0 & entrypolity!=.
replace entrydem=1 if entrypolity>=0 & entrypolity!=.
/* use polity score of +1 for 1992 for H. Aliev as he entered office in transitional period */
replace entrydem=1 if ruler=="H. Aliyev" 
/* Comoros score is +5 in 1975 when Abdallah enters office before coup */
replace entrydem=1 if ruler=="Ahmed Abdallah" 
/* no polity scores available but FH scores are partly free for these: */
replace entrydem=1 if ruler=="Maurice Bishop"
replace entrydem=1 if ruler=="Pinto da Costa"
replace entrydem=1 if ruler=="Rene"
/* Germany is democracy in 1932 */
replace entrypolity=6 if country=="Germany" & ruler=="Adolf Hitler"
/* Ioannis Metaxas  enters in democratic office first */
replace entrypolity=8 if country=="Greece" & ruler=="Metaxas"
/* Bordaberry came in democratic election in 1971 when polity is 3 */
replace entrypolity=3 if country=="Uruguay" & ruler=="Bordaberry"
/* Ngo Dinh Diem and Karzai entered transitional civilian governments */
replace entrydem=1 if ruler=="Ngo Dinh Diem"
replace entrydem=1 if ruler=="Hamid Karzai"
/* seized after civil war */
replace entrydem=0 if ruler=="Habre"
replace entrydem=0 if ruler=="Laurent Kabila"
/* foreign installed */
replace entrydem=0 if ruler=="Taraki"
/* after Shah was deposed */
replace entrydem=0 if ruler=="Khomeini"
/* seized power */
replace entrydem=0 if ruler=="Fidel Castro"
/* seized power in countercoup */
replace entrydem=0 if ruler=="J. Kabila"
/* became president after a coup */
replace entrydem=0 if ruler=="Smetona"
replace entrydem=0 if ruler=="Batista"
/* Mengistu entered in nondemocracy at -7 */
replace entrydem=0 if ruler=="Mengistu"
replace entrypolity=-7 if ruler=="Mengistu"
replace entrydem=0 if ruler=="Daniel Ortega" & year1==1981
replace entrypolity=-5 if ruler=="Daniel Ortega" & year1==1981
replace entrydem=0 if ruler=="AL-Sallal" & year1==1965
replace entrypolity=-3 if ruler=="AL-Sallal" & year1==1965
replace entrypolity=5 if ruler=="Chaudhri M. Ali"
replace entrydem=0 if ruler=="Chiang Kai-shek"
replace entrydem=0 if ruler=="Hun Sen"

save estimation_file, replace



/*******************************************************/
/* Figure 4:  Incumbent takeovers (total number of onsets)  */
/*******************************************************/
/* Code in Figure4/map.R to produce Figure 4 */


/*************************************************/
/*************************************************/
/* Figure 5: Time from entry into office to onset */
/*************************************************/
/*************************************************/

/* create categories for the distribution of timeto in democract and nondemocracy at entry, percent */
use estimation_file
gen timeto2=1 if timeto==0
replace timeto2=2 if timeto==1
replace timeto2=3 if timeto==2
replace timeto2=4 if timeto==3 | timeto==4
replace timeto2=5 if timeto==5 | timeto==6
replace timeto2=6 if timeto==7 | timeto==8 
replace timeto2=7 if timeto==9 | timeto==10 | timeto==11
replace timeto2=8 if timeto>11 & timeto!=.


tab timeto2, gen(timeto_)
collapse (mean) timeto_1 timeto_2 timeto_3 timeto_4 timeto_5 timeto_6 timeto_7 timeto_8 , by(entrydem)
/*transpose in excel, save timeto_demnodem */
clear

use Figure5_6/timeto_demnodem

label define timeto 1 "1st year" 2 "2nd" 3 "3rd" 4 "4-5th" 5 "6-7th" 6 "8-9th" 7 "10-12th" 8 "Over 12"
label values timeto timeto

replace entrydem0= entrydem0*100
replace entrydem1= entrydem1*100

gen entrydem00 = -entrydem0

graph hbar (asis) entrydem00 entrydem1,  ///
     over(timeto,  gap(10) label(labsize(small))) ///
     ylabel(   -20 "20" -10 "10" 0 "0" ///
            10 "10" 20 "20" 30 "30", labsize(vsmall)) ///
             bargap(-100)  ysize(4) xsize(4) scheme(s1mono) bar(1,color(black)) ///
             legend(order(1 2) label(1 "Nondemocratic") label(2 "More democratic at entry") ///
             size(small) region(lstyle(none))) 
              
graph export Figure5_6/timeto_demnodem_perc.pdf, replace

clear


/*************************************************/
/*************************************************/
/* Figure 6: Incumbent takeovers over time  */
/*************************************************/
/*************************************************/


use estimation_file

/* Takeoevers over time in more and less democratic */
gen takeoverdem=1 if entrydem==1
gen takeovernodem=1 if entrydem==0
bysort year1: egen numeventsdem=sum(takeoverdem)
bysort year1: egen numeventsnodem=sum(takeovernodem)


             

graph twoway  lowess numeventsnodem year1,  lpattern(solid) lcolor(black) ///
|| lowess numeventsdem year1, lpattern(dash)  lwidth(thin) lcolor(black) ///
|| line numeventsnodem year1, lpattern(solid)  lwidth(vthin) lcolor(gs12)  ///
|| line numeventsdem year1, lpattern(dash)  lwidth(vthin)  lcolor(gs12) ///
xlabel(1920(10)2020, valuelabel angle(45)) ///
ylabel(0(2)8, valuelabel angle(360)) ///
plotregion(margin(r+1 t+0.5))  xsize(8) ysize(5) ///
xtitle("Year") ytitle("Number of events")   scheme(s1mono) legend(order(1 2) ///
 label(1 "Nondemocratic")  label(2 "More democratic at entry") ///             size(small) region(lstyle(none)))

graph export Figure5_6/timeline_dem_nodem.pdf, replace


/**************************************************/
///***     summary stats for discussion in text   ***///
/*******************************************************/

gen takeover=1
recode year1 (1920/1929=1920) (1930/1939=1930) (1940/1949=1940) (1950/1959=1950) (1960/1969=1960) (1970/1979=1970) (1980/1989=1980) (1990/1999=1990) (2000/2009=2000) (2010/2019=2010), gen(decade)
tabstat takeover, by(decade) stats(n)

bysort year: egen yeartakeover=sum(takeover)
tabstat yeartakeover, stats(mean median n)

tabstat takeover if entrydem==1, by(decade) stats(n)


clear


