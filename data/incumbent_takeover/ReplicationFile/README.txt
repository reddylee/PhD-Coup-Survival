README

This is the replication file folder for "Incumbent Takeovers".

Stata 12.1 was used for the majority of figures and tables in the paper and the appendix. R 3.5.2 (using packages such as rworldmap and RColorBrewer) was used to make a map in Figure 4. All code files and data files are provided in this replication package, as outlined below. Figures 1 and 3 (conceptual figures) were drawn in AutoCAD. 

For the incumbent takeovers data (279 leader obs), use IncumbentTakeovers.xls and codebook.pdf

To replicate the analysis, execute scripts in this order:

1) estimations.do
2) estimations_appendix.do


FILE OVERVIEW

estimations.do: Stata code to produce Figure 2 (input files are in Figure2 folder); Figure 5 and Figure 6. Figures 1 and 3 (conceptual figures) were drawn in AutoCAD.

estimation_file.dta: Main Stata data estimation file

log_file.smcl: log file for all paper analyses

rulers_takeovers.dta: Stata input file with takeovers at the leader level

Figure2: folder that contains Stata code used to produce categorisations from the Freedom House data, input two files, freedomhouse2020.dta and leaders.dta, Excel file that was generated in the intermediate step to transpose the data, as well as the summary data set, fh_cats.dta, used to produce Figure 1

Figure4: Map.R R code to generate the map in Figure 4 as well as the input file. 

Figure5_6: includes timeto_demnodem.dta, Stata input file to produce Figure 5, as well as Excel file that was generated in the intermediate step to transpose the data. 

appendix.do: Stata code to produce all figures and tabled included in a supplementary appendix

log_appendix.smcl: log file for all appendix analyses

appendix: folder that contains all required input files and additional code files that are required to run appendix.do. During replication all figures from the appendix are saved in appendix folder for convenience. 




