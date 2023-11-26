**********************************************************************
   
        *** Coup Leaders: A New, Comprehensive Dataset, 1950-2020 ***

* Content: Replication of Thyne and Powell with Coup Leaders Data
* Author: Tanja Eschenauer-Engler, Bastian Herre
* Date: June 2023
**********************************************************************

* Starting commands

clear all
set more off


* Please define your own working directory
cd "???"


* Import dataset:
use "Coup Leaders_Replicating P&T with CL.dta"


***********************************************************
*** Replication of Thyne and Powell (2016) with CL data ***
***********************************************************

* first model in each package of models always replicates original model from T&P (2016)
* following three models replicate original model with CL data


set scheme plotplain


* Focus on any recent coup (left plot in Fig. 4 in Manuscript; Tab. 1 in Appendix)
**********************************************************************************

logit dem coup_any prev_dem colbrit ind cold gdppc chgdppc time time2 time3, nolog
eststo m1
logit dem senior_any prev_dem colbrit ind cold gdppc chgdppc time time2 time3, nolog
eststo m2
logit dem midrank_any prev_dem colbrit ind cold gdppc chgdppc time time2 time3, nolog
eststo m3
logit dem junior_any prev_dem colbrit ind cold gdppc chgdppc time time2 time3, nolog
eststo m4

esttab m1 m2 m3 m4 using "any_coup types_democratization.rtf" , b(3) r2 not se nogaps star(* 0.10 ** 0.05 *** 0.01) alignment(cr) nonumbers order(coup_any senior_any midrank_any junior_any prev_dem colbrit ind cold gdppc chgdppc time time2 time3) label mtitles("(1)" "(2)" "(3)" "(4)") nonotes addnotes("* = p < 0.1; ** = p < 0.05; *** = p < 0.01")

coefplot m1 m2 m3 m4, keep (coup_any senior_any midrank_any junior_any) coeflabel(coup_any="Recent coup (TP)" senior_any="Senior coup" midrank_any="Mid-rank coup" junior_any= "Junior coup")xline(0) level(90) legend(pos(6) col(4)) title(Any recent coups)

graph save "all coups_democratization.gph", replace



* Focus on successful coups (plot in the middle of Fig. 4 in Manuscript; Tab. 2 in Appendix)
********************************************************************************************

logit dem coup_success prev_dem colbrit ind cold gdppc chgdppc time time2 time3, nolog
eststo m5
logit dem senior_success prev_dem colbrit ind cold gdppc chgdppc time time2 time3, nolog
eststo m6
logit dem midrank_success prev_dem colbrit ind cold gdppc chgdppc time time2 time3, nolog
eststo m7
logit dem junior_success prev_dem colbrit ind cold gdppc chgdppc time time2 time3, nolog
eststo m8

esttab m5 m6 m7 m8 using "succ_coup types_democratization.rtf" , b(3) r2 not se nogaps star(* 0.10 ** 0.05 *** 0.01) alignment(cr) nonumbers order(coup_success senior_success midrank_success junior_success prev_dem colbrit ind cold gdppc chgdppc time time2 time3) label mtitles("(5)" "(6)" "(7)" "(8)") nonotes addnotes("* = p < 0.1; ** = p < 0.05; *** = p < 0.01")

coefplot m5 m6 m7 m8, keep (coup_success senior_success midrank_success junior_success) coeflabel(coup_success="Succ. coup (TP)" senior_success="Succ. senior" midrank_success="Succ. mid-rank" junior_success= "Succ. junior")xline(0) level(90) legend(pos(6) col(4)) title(Successful coups)

graph save "successful coups_democratization.gph", replace 


* Focus on failed coups (right plot in Fig. 4 in Manuscript; Tab. 3 in Appendix)
********************************************************************************


logit dem coup_failed prev_dem colbrit ind cold gdppc chgdppc time time2 time3, nolog
eststo m9
logit dem senior_fail prev_dem colbrit ind cold gdppc chgdppc time time2 time3, nolog
eststo m10
logit dem midrank_fail prev_dem colbrit ind cold gdppc chgdppc time time2 time3, nolog
eststo m11
logit dem junior_fail prev_dem colbrit ind cold gdppc chgdppc time time2 time3, nolog
eststo m12

esttab m9 m10 m11 m12 using "fail_coup types_democratization.rtf" , b(3) r2 not se nogaps star(* 0.10 ** 0.05 *** 0.01) alignment(cr) nonumbers order(coup_failed senior_fail midrank_fail junior_fail prev_dem colbrit ind cold gdppc chgdppc time time2 time3) label mtitles("(9)" "(10)" "(11)" "(12)") nonotes addnotes("* = p < 0.1; ** = p < 0.05; *** = p < 0.01")

coefplot m9 m10 m11 m12 , keep (coup_failed senior_fail midrank_fail junior_fail) coeflabel(coup_failed="Fail. coup (TP)" senior_fail="Failed senior" midrank_fail="Fail. mid-rank" junior_fail= "Fail. junior")xline(0) level(90) legend(pos(6) col(4)) title(Failed coups)

graph save "failed coups_democratization.gph", replace


* Creating Figure 4 by combining graphs 
***************************************

graph combine "all coups_democratization.gph" "successful coups_democratization.gph" "failed coups_democratization.gph", rows(1) imargin(2 2 2 2) 
