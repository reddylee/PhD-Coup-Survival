/********************************************************/
/* prepare the input file for takeover numbers per country */
/********************************************************/

/* takeovers based on leaders data */
use estimation_file
gen takeover=1
collapse (sum) takeover, by(iso3n)

gen iso3n2=iso3n
replace iso3n2=643 if iso3n2==810
replace iso3n2=203 if iso3n2==200
replace iso3n2=729 if iso3n2==736
replace iso3n2=834 if iso3n2==835
replace iso3n2=887 if iso3n2==886
replace iso3n2=688 if iso3n2==890
replace iso3n2=158 if iso3n2==0
/* give 6 and above for a country with 9 */
replace takeover=6 if takeover>6 & takeover!=.
/* for fixed format in maps need values outside, arbitrary 8 */
replace takeover=8 if iso3n2==158

save takeoveruler_sums, replace


/* takeovers based on country data */
use takeovers_all
gen takeover=1
replace takeover=. if exclude==1

collapse (sum) takeover, by(iso3n)
replace iso3n = 200 if iso3n==201.5
gen iso3n2=iso3n
replace iso3n2=643 if iso3n2==810
replace iso3n2=203 if iso3n2==200
replace iso3n2=729 if iso3n2==736

replace iso3n2=834 if iso3n2==835
replace iso3n2=887 if iso3n2==886
replace iso3n2=688 if iso3n2==890
replace iso3n2=158 if iso3n2==0

/* for fixed format in maps need values outside */
replace takeover=16 if iso3n2==158

save takeovers_sums, replace



