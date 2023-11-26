**********************************************************************
   
        *** Coup Leaders: A New, Comprehensive Dataset, 1950-2020 ***

* Content: Descrptive analysis (Fig. 1-3)
* Author: Tanja Eschenauer-Engler, Bastian Herre
* Date: June 2023
**********************************************************************

* Starting commands

clear all
set more off


* Please define your own working directory and create a folder named "Graphs" in your WD where you can store the figures
cd "???"

ssc install spineplot
set scheme plotplain 


* Import dataset:
use "Coup Leaders_Descriptive Analysis.dta"


*** Figure 1: Create spine plot of successes and failures across coup types ****
*********************************************************************************

generate success_num = 0 if success == "no"
replace success_num = 1 if success == "yes"
label variable success_num "Coup success"
label define success_num 0 "failed coup" 1 "successful coup"
label values success_num success_num
by success_num rankgroup_num, sort: gen N=_N
spineplot success_num rankgroup_num, text(N, mlabcolor(white)) legend(off) xlabel("", labsize(big) noticks) ylabel(0.2 "failed coup" 0.7 "successful coup", labsize(big) noticks axis(2)) ytitle("") xtitle("") bar1(color(gs3)) bar2(color(gs7))
drop N
graph export "Graphs/spineplot_sample.png", replace

save "Coup Leaders_Descriptive Analysis.dta", replace



*** Figure 2: Summarize coup types per year ***
***********************************************

collapse (sum) coup coup_military coup_civilian coup_junior coup_mid coup_senior, by(year)
line coup_civilian year, legend(off) ytitle("") xtitle("") ylabel(0(5)10) xlabel(1950(10)2020) text(4 1968 "civilian", placement(e)) saving(Graphs/civilian, replace) nodraw
line coup_senior year, legend(off) ytitle("") xtitle("") ylabel(0(5)10) xlabel(1950(10)2020) text(9 1968 "senior officer", placement(e)) saving(Graphs/senior, replace) nodraw
line coup_mid year, legend(off) ytitle("") xtitle("") ylabel(0(5)10) xlabel(1950(10)2020) text(8 1968 "mid-ranking officer", placement(e)) saving(Graphs/mid, replace) nodraw
line coup_junior year, legend(off) ytitle("") xtitle("") ylabel(0(5)10) xlabel(1950(10)2020) text(6 1968 "junior officer", placement(e)) saving(Graphs/junior, replace) nodraw
graph combine Graphs/senior.gph Graphs/mid.gph Graphs/junior.gph Graphs/civilian.gph, col(1) imargin(0 0 0 3)
graph export "Graphs/line_couptypes.png", replace
erase "Graphs/civilian.gph"
erase "Graphs/senior.gph"
erase "Graphs/mid.gph"
erase "Graphs/junior.gph"
clear all


*** Figure 3: Coups by different coup leades across regime types ***
********************************************************************

use "Coup Leaders_Descriptive Analysis.dta"
catplot regime rankgroup_num, asyvars stack bar(1, bcolor(gs1)) bar(2, bcolor(gs5)) bar(3, bcolor(gs8)) bar(4, bcolor(gs11)) bar(5, bcolor(gs14))   blabel(bar, position(center)) legend(pos(6) row(1))
graph save "Graphs\catplot coup by regimetypes.gph", replace

