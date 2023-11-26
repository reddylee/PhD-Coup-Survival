/*************************************************/
/*************************************************/
/* Coding reasons for Freedom House downgrades */
/*************************************************/
/*************************************************/

clear

/* count of transitions from PF to NF */
use Figure2/freedomhouse2020.dta

gen lagmean=mean[_n-1] if country==country[_n-1]
gen lagpr=pr[_n-1] if country==country[_n-1]
gen lagcl=cl[_n-1] if country==country[_n-1]
gen lagstatus=status[_n-1] if country==country[_n-1]
keep  if status=="Not Free" & status[_n-1]!="Not Free" & mean[_n-1]!=. & country==country[_n-1]
drop inverse_pr inverse_cl inverse_mean sum inverse_sum min max inverse_min inverse_max
gen change="F/PF to NF"

save Figure2/fh_dembreak2020, replace

clear
use Figure2/freedomhouse2020.dta
sort ccode year
gen lagmean=mean[_n-1] if country==country[_n-1]
gen lagpr=pr[_n-1] if country==country[_n-1]
gen lagcl=cl[_n-1] if country==country[_n-1]
gen lagstatus=status[_n-1] if country==country[_n-1]
keep  if status=="Partly Free" & status[_n-1]=="Free" & mean[_n-1]!=. & country==country[_n-1]
drop inverse_pr inverse_cl inverse_mean sum inverse_sum min max inverse_min inverse_max
gen change="F to PF"
save Figure2/fh_partlybreak2020, replace

clear
use Figure2/fh_dembreak2020
append using Figure2/fh_partlybreak2020
save Figure2/fhallbreaks2020, replace


sort ccode year
merge ccode year using Figure2/leaders, nokeep
drop _merge
/* drop repeated leaders per year */
drop if leader=="Mohammad Musa Shafiq"
drop if leader=="Benjedid"
drop if leader=="Boudiaf"
drop if leader=="Peron, Isabel"
drop if leader=="Ramon Puerta"
drop if leader=="de la Rua"
drop if leader=="Abulfaz Elchibey"
drop if leader=="H. Aliyev" & year==2003
drop if leader=="Sheikh Mujib Rahman"
drop if leader=="Moshtaque Ahmed"
drop if leader=="Gueiler Tejada"
drop if leader=="Carlos Mesa"
drop if leader=="Zerbo"
drop if leader=="Sankara"
drop if leader=="Ndadaye"
drop if leader=="Ngueze"
drop if leader=="Patasse"
drop if leader=="Francois Bozize" & year==2013
drop if leader=="Allende"
drop if leader=="Ngouabi" & year==1977
drop if leader=="Lissouba"
drop if leader=="Houphouet-Boigny" & year==1993
drop if leader=="Makarios"
drop if leader=="Sampson"
drop if leader=="Duran Ballen"
drop if leader=="Mahuad"
drop if leader=="Mohamed Morsy"
drop if leader=="Laar"
drop if leader=="Savisaar"
drop if leader=="Selassie"
drop if leader=="Banti"
drop if leader=="Mara"
drop if leader=="Bavadra"
drop if leader=="Chaudhry"
drop if leader=="Ratu Josefa Iloilo"
drop if leader=="Laisenia Qarase"
drop if leader=="Bongo"
drop if leader=="Rose Francine Rogombe"
drop if leader=="Jawara" & year==1994
drop if leader=="Rawlings"
drop if leader=="Arana Osorio"
drop if leader=="Raimundo Pereira"
drop if leader=="Manuel Serifo Nhamadjo"
drop if leader=="Malam Bacai Sanhá"
drop if leader=="Manigat"
drop if leader=="Avril"
drop if leader=="Namphy" & startdate=="07/02/1986"
drop if leader=="Pascal-Troillet"
drop if leader=="Cedras"
drop if leader=="Rao"
drop if leader=="Phomivan"
drop if leader=="Aoun"
drop if leader=="Tolbert"
drop if leader=="Amadou Toure"
drop if leader=="Amadou Haya Sanogo"
drop if leader=="Sidi Mohamed Ould Cheikh Abdallahi"
drop if leader=="Ousmane"
drop if leader=="Babangida"
drop if leader=="Shonekan"
drop if leader=="Sharif"
drop if leader=="Kania"
drop if leader=="Momoh"
drop if leader=="Kabbah"
drop if leader=="Al-Mirghani"
drop if leader=="Iskandrov"
drop if leader=="Nabiyev"
drop if leader=="Seni Pramoj"
drop if leader=="Kukrot Pramoj"
drop if leader=="Sangad"
drop if leader=="Choonhavan"
drop if leader=="Surayud Chulanont"
drop if leader=="Thaksin Shinawatra" & year==2006
drop if leader=="Yingluck Shinawatra"
drop if leader=="Niwattumrong Boonsongpaisan"
drop if leader=="Manning"
drop if leader=="Demirel"
drop if leader=="Viktor Yuschenko"
drop if leader=="Mendez Manfredini"
drop if leader=="Demichelli"
drop if leader=="Caldera Rodriguez"
drop if leader=="Minh"


/* add leaders not in archigos */
replace leader="Aristides Pereira" if country=="Cape Verde"
replace startdate="08/07/1975" if leader=="Aristides Pereira"
replace enddate="22/03/1991" if leader=="Aristides Pereira"
replace leader="Hassanal Bolkiah" if country=="Brunei"
replace startdate="04/10/1967" if country=="Brunei"
replace enddate="31/12/2015" if country=="Brunei"
replace leader="Danilo Medina" if country=="Dominican Republic" & year==2015
replace startdate="16/08/2012" if leader=="Danilo Medina"
replace enddate="31/12/2015" if leader=="Danilo Medina"
replace leader="Mosisili" if country=="Lesotho" & year==2015
replace startdate="17/03/2015" if country=="Lesotho" & year==2015
replace enddate="31/12/2015" if country=="Lesotho" & year==2015
replace leader="Ibrahim Nasir" if country=="Maldives" & year==1973
replace startdate="11/11/1968" if leader=="Ibrahim Nasir"
replace enddate="11/11/1978" if leader=="Ibrahim Nasir"
replace leader="Maumoon Abdul Gayoom" if country=="Maldives" & year==1988
replace startdate="11/11/1978" if leader=="Maumoon Abdul Gayoom"
replace enddate="11/11/2008" if leader=="Maumoon Abdul Gayoom"
replace leader="Dom Mintoff" if country=="Malta"
replace startdate="05/03/1962" if country=="Malta"
replace enddate="22/12/1984" if country=="Malta"
replace leader="Milo Dukanovic" if country=="Montenegro"
replace startdate="04/12/2012" if country=="Montenegro"
replace enddate="31/12/2015" if country=="Montenegro"
replace leader="Manuel Pinto da Costa" if country=="Sao Tome & Principe"
replace startdate="12/07/1975" if country=="Sao Tome & Principe"
replace enddate="04/03/1991" if country=="Sao Tome & Principe"
replace leader="France-Albert Rene" if country=="Seychelles"
replace startdate="05/06/1977" if country=="Seychelles"
replace enddate="16/04/2004" if country=="Seychelles"
replace leader="Sogavare" if country=="Solomon Islands"
replace startdate="30/06/2000" if country=="Solomon Islands"
replace enddate="17/12/2001"  if country=="Solomon Islands"
replace leader="Bouterse" if country=="Suriname" 
replace startdate="25/02/1980" if country=="Suriname" 
replace enddate="23/12/1990" if country=="Suriname"
replace leader="Walter Lini" if country=="Vanuatu"
replace startdate="30/07/1980" if country=="Vanuatu"
replace enddate="06/09/1991" if country=="Vanuatu"
replace leader="Saleh" if country=="Yemen"
replace startdate="22/05/1992" if country=="Yemen"
replace enddate="27/02/2012" if country=="Yemen"
replace leader="Maurice Bishop" if country=="Grenada" 
replace startdate="13/03/1979" if country=="Grenada" 
replace enddate="13/10/1983" if country=="Grenada"
replace leader="Vere Bird" if country=="Antigua & Barbuda"
replace startdate="01/11/1981" if country=="Antigua & Barbuda"
replace enddate="09/03/1994" if country=="Antigua & Barbuda"
replace leader="Ahmed Abdallah" if country=="Comoros" & year==1985
replace leader="King Gyanendra" if country=="Nepal" & year==2005
replace startdate="04/07/2001" if country=="Nepal" & year==2005
replace enddate="28/05/2008" if country=="Nepal" & year==2005

replace leader="Vere Bird" if country=="Antigua and Barbuda" & year==1991
replace startdate="01/11/1981" if country=="Antigua and Barbuda" & year==1991
replace enddate="09/03/1994" if country=="Antigua and Barbuda" & year==1991
replace leader="Orban" if country=="Hungary" & year==2018
replace startdate="29/05/2010" if country=="Hungary" & year==2018
replace enddate="31/12/2019" if country=="Hungary" & year==2018
replace leader="Nayib Bukele" if country=="El Salvador" & year==2019
replace startdate="01/06/2019" if country=="El Salvador" & year==2019
replace enddate="31/12/2019" if country=="El Salvador" & year==2019
replace leader="Daniel Ortega" if country=="Nicaragua" & year==2018
replace startdate="10/01/2007" if country=="Nicaragua" & year==2018
replace enddate="31/12/2019" if country=="Nicaragua" & year==2018
replace leader="Maduro" if country=="Venezuela" & year==2016
replace startdate="05/03/2013" if country=="Venezuela" & year==2016
replace enddate="31/12/2019" if country=="Venezuela" & year==2016

replace leader="Vucic" if country=="Serbia" & year==2018
replace startdate="31/05/2017" if country=="Serbia" & year==2018
replace enddate="31/12/2019" if country=="Serbia" & year==2018
replace leader="Pinto da Costa" if country=="Sao Tome and Principe" & year==1977
replace startdate="12/07/1975" if country=="Sao Tome and Principe" & year==1977
replace enddate="04/06/1991" if country=="Sao Tome and Principe" & year==1977
replace leader="Sall" if country=="Senegal" & year==2019
replace startdate="02/04/2012" if country=="Senegal" & year==2019
replace enddate="31/12/2019" if country=="Senegal" & year==2019
replace leader="Talon" if country=="Benin" & year==2019
replace startdate="06/04/2016" if country=="Benin" & year==2019
replace enddate="31/12/2019" if country=="Benin" & year==2019
replace leader="Museveni" if country=="Uganda" & year==2018
replace startdate="21/01/1986" if country=="Uganda" & year==2018
replace enddate="31/12/2019" if leader=="Museveni"
replace leader="Mnangagwa" if country=="Zimbabwe" & year==2017
replace startdate="24/11/2017" if country=="Zimbabwe" & year==2017
replace enddate="31/12/2019" if country=="Zimbabwe" & year==2017
replace enddate="21/11/2017" if leader=="Mugabe"
replace leader="Erdogan" if country=="Turkey" & year==2017
replace startdate="14/03/2003" if country=="Turkey" & year==2017
replace enddate="31/12/2019" if country=="Turkey" & year==2017
replace leader="Win Myint" if country=="Myanmar" & year==2019
replace startdate="30/03/2018" if country=="Myanmar" & year==2019
replace enddate="31/12/2019" if country=="Myanmar" & year==2019

/* dates */
gen sdate=date(startdate,"DMY")
format sdate %td
generate starty=year(sdate)
gen edate=date(enddate,"DMY")
format edate %td
generate endy=year(edate)
gen timeto=year-starty


save Figure2/fh2020, replace



ren leader ruler

/* categorize democratic breakdown */ 

gen reason=""

replace reason="parliament dismissed" if ruler=="Preval"
replace reason="disputed election" if ruler=="Balaguer" & year==1974
replace reason="disputed election" if ruler=="Balaguer" & year==1993
replace reason="term limits" if country=="Dominican Republic" & year==2015
replace reason="disputed election" if country=="Trinidad & Tobago" & year==2001
replace reason="came in coup" if ruler=="Maurice Bishop" & year==1979 /* not takeover */
replace reason="constitution suspended" if ruler=="Maurice Bishop" & year==1980
replace reason="violence and crime" if country=="Antigua & Barbuda"  /* not takeover */
replace reason="violence and crime" if country=="Mexico" /* not takeover */
replace reason="disputed election" if ruler=="Laugerud Garcia" 
replace reason="insurgence and conflict" if ruler=="Lucas Garcia" /* not takeover */
replace reason="insurgence and conflict" if ruler=="Suazo Cordova" /* not takeover */
replace reason="violence and crime" if ruler=="Callejas" /* not takeover */
replace reason="coup attempts" if ruler=="Flores Facusse" /* not takeover: due to military challenges to civilian rule  */
replace reason="insurgence and conflict" if ruler=="Molina" /* not certain but probably left violence and govt repression */
replace reason="rights abuses, various" if ruler=="Noriega" /* report lists various violations */
replace reason="violence and crime" if ruler=="Vargas" /* not takeover */
replace reason="coup attempts" if ruler=="Andres Perez" /* not takeover: "Perez barely survived an attempted *//* coup by mid-level military officers in February 1992" */
replace reason="concentration of power" if ruler=="Hugo Chavez"
/* due  to  the  decision  of President Hugo Chavez, ratified in  a national referendum, to abolish congress */
/* and the judiciary, and  by  his  creation  of a parallel  government of military cronies */


replace reason="disputed election" if ruler=="Burnham"  & year==1973
replace reason="one party state" if ruler=="Burnham"  & year==1974
replace reason="violence and crime" if country=="Guyana"  & year==2005 /* not takeover */
replace reason="removed or ousted" if ruler=="Bucaram Ortiz"  /* not takeover */
replace reason="coup attempts" if ruler=="Gustavo Noboa" /* not takeover: due to a partially successful military coup in January 2000 that succeeded in overthrowing the elected president */
replace reason="violence and crime" if ruler=="Garcia Perez" /* not takeover */
replace reason="violence and crime" if ruler=="Franco, Itamar" /* not takeover: the result of a growing climate of lawlessness and insecurity related to escalating criminal violence  */
replace reason="constitution suspended" if ruler=="Banzer Suarez" & year==1974
replace reason="came in coup" if ruler=="Garcia Meza Tejada" & year==1980 /* not takeover */
replace reason="constitution manipulated" if ruler=="Gonzalo Sanchez de Lozada" & year==1995 
replace reason="removed or ousted" if ruler=="Gonzalo Sanchez de Lozada" & year==2003 /* not takeover */
replace reason="violence and crime" if ruler=="Stroessner" & year==1976 /* not takeover */
replace reason="removed or ousted" if ruler=="Stroessner" & year==1988 /* not takeover */
 replace reason="came in coup" if ruler=="Pinochet" & year==1973 /* not takeover */
 replace reason="rights abuses, various" if ruler=="Peron" & year==1974 /* not certain, but probably rights abuses and violence in 74 */
  replace reason="came in coup" if ruler=="Videla" & year==1976 /* not takeover */
 replace reason="violence and crime" if ruler=="Adolfo Rodriguez Saa"  /* not takeover */
replace reason="constitution manipulated" if ruler=="Bordaberry" 
 replace reason="came in coup" if ruler=="Jaruzelski"  /* not takeover */
replace reason="rights abuses, various" if ruler=="Meciar" /* because of government pressure on freedom of expression and minority rights.*/ 
replace reason="disputed election" if ruler=="Dom Mintoff" 
replace reason="rights abuses, various" if country=="Montenegro" /* not takeover */
replace reason="insurgence and conflict" if ruler=="Milosevic" & year==1991 /*  Serbia's  Communist  regime  took  steps  to  takeover  the  Yugoslav  government */
replace reason="concentration of power" if ruler=="Milosevic" & year==1993 /*various, emphasis on increased restrictions on the opposition.*/
 
replace reason="insurgence and conflict" if ruler=="Clerides" /* not takeover */
replace reason="concentration of power" if ruler=="Putin" /* due  to  the  virtual  elimination  of influential  political  opposition  parties  within  
the  country  and  the  further  concentration  of executive power */
replace reason="rights abuses, various" if ruler=="Vahi" /* not takeover */
replace reason="rights abuses, various" if ruler=="Godmanis" /* not takeover */
  
replace reason="concentration of power" if ruler=="Viktor Yanukovych" /* due to deteriorating media freedom,  secret service pressure on universities  */
 /*...  government hostility toward  opposition  gatherings  and  foreign  nongovernmental  organizations,  and  an  increase  in  */
 /* presidential  influence  over the judiciary */
replace reason="concentration of power" if ruler=="Lukashenko" /* "president's constitutional draft would give him virtual  dictatorial control of the government with?out parliamentary  checks. */
replace reason="insurgence and conflict" if ruler=="H. Aliyev" /* not takeover */  
replace reason="disputed election" if ruler=="Ilhma Aliyev"  
 replace reason="one party state" if ruler=="Aristides Pereira"  & year==1976 
  replace reason="2nd change" if ruler=="Aristides Pereira"  & year==1988 /* not takeover */  
   replace reason="one party state" if ruler=="Manuel Pinto da Costa"  
replace reason="removed or ousted" if ruler=="Mamadu Turé Kuruma" /* not takeover */   
 replace reason="coup attempts" if ruler=="Jawara" & year==1981 /* not takeover */  
  replace reason="came in coup" if ruler=="Jammeh" & year==1994  /* not takeover */  
  replace reason="disputed election" if ruler=="Jammeh" & year==2011 /* due to President Yayha Jammeh's severe suppression of the opposition, media, and civil society in the run-up to the November presidential election */
  replace reason="insurgence and conflict" if ruler=="Konare"  /* not takeover */ 
    replace reason="came in coup" if ruler=="Dioncounda Traoré"   /* not takeover */   
  replace reason="concentration of power" if ruler=="Abdoulaye Wade" /* due to the growing authoritarian power of the presi?dent  and  ruling  party  as  well  as  the  increasing  marginalization  of the  opposition */ 
 replace reason="disputed election" if ruler=="Sidi Ahmed Taya"   /* not takeover */  
replace reason="insurgence and conflict" if country=="Cote d'Ivoire" & year==2002
  replace reason="removed or ousted" if ruler=="Lamizana" /* not takeover */    
  replace reason="rights abuses, various" if ruler=="Taylor" & year==2001 /*because of further attempts to muzzle opposition voices,  including the press,  university  students,  and  attorneys */
  replace reason="violence and crime" if ruler=="Ernest Bai Koroma"  /* not takeover */ 
replace reason="removed or ousted" if ruler=="Limann" /* not takeover */   
replace reason="insurgence and conflict" if ruler=="Museveni"  & year==1991 /* mentions power but also "became more repressive. Counter-insurgency efforts begun last year in the eastern and western parts */
   
   
replace reason="2nd change" if ruler=="Museveni"  & year==2014  /* not takeover */   
replace reason="concentration of power" if ruler=="Moi"  & year==1987 /* not certain but "In  this  increasingly  dictatorial  state   both   parliament   and   judiciary   have   become   subservient   to   the   president" */
replace reason="rights abuses, various" if ruler=="Pierre Nkurunziza"  /* "government increased its crackdown on opposition parties and restricted freedom of assembly in 2014*/
 replace reason="one party state" if ruler=="Gouled Aptidon"  & year==1981 /* one party state and elected unopposed */
 
 replace reason="rights abuses, various" if ruler=="Gouled Aptidon"  & year==1985 /* not takeover, "There   have   recently   been   prisoners  of  conscience  and  torture" */ 
 replace reason="term limits" if ruler=="Guelleh"  & year==2010
 replace reason="various" if ruler=="Meles Zenawi"  & year==1993 /* not takeover */
 replace reason="disputed election" if ruler=="Meles Zenawi"  & year==2010 
replace reason="rights abuses, various" if ruler=="Mugabe"  & year==2001 /*very critical of 2000 election. Also, "due to numerous and repeated actions taken by the government  to  limit the  ability  of citizens  to  organize  and  to  express  themselves */
replace reason="insurgence and conflict" if ruler=="Botha" /* not takeover */  
replace reason="disputed election" if ruler=="Mosisili"  & year==2009
/* Lesotho: due to unresolved disputes over legislative seats from the 2007 and 2008 elections and a breakdown in internationally mediated negotiations */
replace reason="2nd change" if ruler=="Mosisili"  & year==2015 /* not takeover */ 
replace reason="concentration of power" if ruler=="Mswati"  & year==1993 
replace reason="concentration of power" if ruler=="Ratsiraka"  & year==1976 /* elected for 7-year term in referendum, new socialist constitution */
replace reason="rights abuses, various" if ruler=="Ratsiraka"  & year==1978  /* not takeover, protests suppressed */ 
   replace reason="concentration of power" if ruler=="Ahmed Abdallah"     /*FH lists "election  was  an  uncontested  99%  event.    The  posi-tion   of   Prime   Minister   was   subsequently   abolished  and  autocratic  rule   enhanced. */        
replace reason="rights abuses, various" if ruler=="Ramgoolam"  & year==1978  /* FH lists various HR problems */        
    replace reason="came in coup" if ruler=="France-Albert Rene"  & year==1977  /* not takeover */             
  replace reason="one party state" if ruler=="France-Albert Rene"  & year==1979 /* one party state and runs unopposed */
replace reason="concentration of power" if ruler=="Zine Al-Abidine Ben Ali"  & year==1993  
replace reason="2nd change" if ruler=="Zine Al-Abidine Ben Ali"  & year==1998  /* not takeover */   
replace reason="insurgence and conflict" if country=="Libya" 
replace reason="concentration of power" if ruler=="Ayatollah Khomeini"  & year==1981 /* purge of supporters: following terror attack, purge against leftist islamists to consolidate power */
     replace reason="came in coup" if ruler=="Evren"  & year==1980  /* not takeover */  
replace reason="insurgence and conflict" if ruler=="Mubarak"  & year==1993 /*increasing terrorist violence and corresponding government crackdowns */


replace reason="insurgence and conflict" if ruler=="Franjieh"
 replace reason="insurgence and conflict" if ruler=="Gemayel, Amin"
 replace reason="parliament dismissed" if ruler=="Abdullah Ibn Hussein El-Hashimi"  & year==2009
replace reason="came in coup" if ruler=="Al-Hamadi" /* not takeover */  
replace reason="foreign occupation" if ruler=="Jabir As-Sabah" /* not takeover */

  
replace reason="concentration of power" if ruler=="Niyazov"  /* "Rejecting calls for greater political democratization */
/* and market-style economic reforms, Niyazov concentrated power in his office and, in many ways, had become as powerful as the Khan */
replace reason="concentration of power" if ruler=="Akayev" & year==2000 
/* Akaev: due to the holding  of parliamentary  and presi?dential  elections  that were  neither free  nor fair,  and  the further consolidation  of power by  the  country's  president.*/

replace reason="concentration of power" if ruler=="Kurmanbek Bakiyev" & year==2009 /*due to a flawed presidential election, the concentration of power in the executive branch*/
replace reason="concentration of power" if ruler=="Karimov"  & year==1992
/* Shortly after his inauguration, President Karimov consolidated his power by *//*abolishing the office of vice president held by rival Shukrulla Mirsaidov, who was *//*accused of ties with organized crime and inciting the student riots to destabilize the *//*government Mirsaidov was named a "state secretary," and Karimov created the office *//*of prime minister, appointing Abdulkhashim Mutalov, his former deputy */

replace reason="concentration of power" if ruler=="Nazarbaev" /* also disputed election but mostly "President Nazarbayev's increasing dominance of the country.*/
replace reason="rule by decree" if ruler=="Gandhi, I." 
replace reason="rights abuses, various" if ruler=="Wangchuck, Jigme Singye" /* not certain, probably abuses of nepalese minority */
replace reason="parliament dismissed" if ruler=="Zia"  /* elected president, parliament dismissed, predecessor executed */
/* PM manipulates and postpones elections */
replace reason="delayed election" if ruler=="Bandaranaike, S" 
replace reason="insurgence and conflict" if ruler=="Ibrahim Nasir" /* not takeover */ 
replace reason="disputed election" if ruler=="Maumoon Abdul Gayoom" & year==1988
replace reason="concentration of power" if ruler=="King Gyanendra" /*as  a result of a February 2005  "palace coup"  in which King  Gyanendra  dissolved  parliament,  assumed  direct rule*/
replace reason="came in coup" if ruler=="Panyarachun" & year==1991 /* not takeover */
replace reason="insurgence and conflict" if ruler=="Ranariddh" /* not takeover */ 
/* PM is replaced by a single party regime */ 
replace reason="insurgence and conflict" if ruler=="Souvanna Phouma" /* not takeover */ 
/* right-wing unity coalition and concentration of power */
  replace reason="rights abuses, various" if ruler=="Razak"  & year==1974 /* various events in 1974, UMNO wins big, also crackdown on students */
 replace reason="parliament dismissed" if ruler=="Aquino"  & year==1990
replace reason="rights abuses, various" if ruler=="Bambang Yudhoyono" /* not takeover */
replace reason="insurgence and conflict" if ruler=="Sogavare" /* not takeover */ 
replace reason="came in coup" if ruler=="Rabuka" & year==1987 /* not takeover */
 replace reason="removed or ousted" if ruler=="Bainimarama" /* not takeover */   
replace reason="came in coup" if ruler=="Buhari" & year==1984 /* not takeover */
replace reason="rights abuses, various" if ruler=="Chiluba" & year==1993 /* not takeover */
replace reason="rights abuses, various" if ruler=="Muluzi" & year==1999 /* not takeover */
replace reason="various" if ruler=="Shekhar" & year==1991 /* not takeover */
replace reason="violence and crime" if ruler=="Khaleda Zia" & year==1993 /* not takeover */

/* Sri lanka : empowering referendum, election cancelled, other: the   government used its   then current popularity to */
/* guarantee a six-year extension of   its    rule.  */
/* The  referendum on   this issue was    held under a state of   emergency restricting opposition campaigning */

replace reason="concentration of power" if ruler=="Jayewardene" & year==1983 
replace reason="insurgence and conflict" if ruler=="Girija Prasad Koirala" /* not takeover */ 


replace reason="removed or ousted" if ruler=="Thaksin Shinawatra" /* not takeover */ 
 replace reason="disputed election" if ruler=="Gloria Macapagal-Arroyo" 
replace reason="insurgence and conflict" if ruler=="Wingti" /* not takeover */  
 replace reason="violence and crime" if ruler=="Somare"  /* not takeover */      
replace reason="rights abuses, various" if ruler=="Walter Lini" /* not takeover */ 
replace reason="foreign occupation" if ruler=="Van Thieu" /* not takeover */ 

 replace reason="came in coup" if ruler=="Sardar Mohammad Daud Khan"  & year==1973  /* not takeover */  
 replace reason="delayed election" if ruler=="Dos Santos" & year==1992
replace reason="violence and crime" if ruler=="Hamid Karzai" & year==2008 /* Not Free due to rising insecurity and increasing corruption and inefficiency in government */
replace reason="insurgence and conflict" if country=="Algeria" & year==1992
replace reason="rights abuses, various" if country=="Bahrain" & year==1993 /* apparently, violent street protests */
replace reason="rights abuses, various" if country=="Bahrain" & year==2009 /* arrests of several Haq Movement leaders */
replace reason="removed or ousted" if country=="Bangladesh" & year==1975 /* president killed, instability follows */
replace reason="disputed election" if country=="Benin" & year==2019 /* exclusion of all opposition parties from the parliamentary elections */
/* could not find what happened in Antigua in 1988, missing */
replace reason="not clear" if country=="Antigua and Barbuda" & year==1991
/* could not find what happened in Brunei in 1988, missing */
replace reason="not clear" if country=="Brunei" & year==1988
replace reason="removed or ousted" if country=="Burundi" & year==1993 /* not relevant, newly elected leader Ndadaye in October 1993 */
drop if ruler=="Kinigi" /* error, drop a duplicate for the same year */
replace reason="one party state" if country=="Cameroon" & year==1976 /* takeover, all parties are banned in 1976 */
replace reason="came in coup" if country=="Central African Republic" & year==2003 /* not takeover */ 
replace reason="removed or ousted" if country=="Central African Republic" & year==2013 /* not takeover */ 
replace reason="removed or ousted" if country=="Congo (Brazzaville)" & year==1977 /* president assassinated */ 
replace reason="came in coup" if country=="Congo (Brazzaville)" & year==1997 /* took power in civil war win */
replace reason="violence and crime" if country=="Congo (Brazzaville)" & year==2006 /* for corruption, "decreased openness and transparency in government" */
/* could not find what happened in Cote d Ivoire in 1988, missing */
replace reason="not clear" if country=="Cote d'Ivoire" & year==1988
/* Cote d Ivoire in 1993 is messy succession, Houphouët-Boigny dies in Dec, missing. Not takeover */
replace reason="various" if country=="Cote d'Ivoire" & year==1993 /* not takeover */
replace reason="came in coup" if country=="Egypt" & year==2013 /* not takeover */ 
replace reason="violence and crime" if country=="El Salvador" & year==2019 /* not takeover */ 
replace reason="delayed election" if country=="Eritrea" & year==1999 /* takeoever?  */
/*Eritrea 1999 NF due the government's hostile attitude towards the development of civil society and multi-party politics */
replace reason="came in coup" if country=="Ethiopia" & year==1974 /* not takeover */ 
replace reason="various" if country=="Ethiopia" & year==1993 /* transition period, Ethiopia and Eritrea split, not takeover */
replace reason="disputed election" if country=="Gabon" & year==2009 /* increased restrictions on the media in the period of the presidential election as well as a crackdown on postelection protesters */
replace reason="disputed election" if country=="Guinea" & year==1993 
replace reason="removed or ousted" if country=="Haiti" & year==1988 /* Namphy ousted in a coup */
replace reason="came in coup" if country=="Ethiopia" & year==1974 /* not takeover */ 
replace reason="came in coup" if country=="Haiti" & year==1991 /* not takeover */ 
replace reason="concentration of power" if ruler=="Orban" /*due to sustained attacks on the country’s democratic institutions by Prime Minister */
replace reason="rights abuses, various" if country=="Indonesia" & year==1993 /* 1993 Suharto re-elected unopposed but the report refers to various HR deficiences */
replace reason="rights abuses, various" if country=="Iran" & year==1988 /* execution and abuses of 1000s of leftists but they were outsome of the regime, so perhaps not a purge */
replace reason="not clear" if country=="Jordan" & year==1988 /* 1988 austerity and economic crisis but not clear FH the reason */
replace reason="parliament dismissed" if country=="Jordan" & year==2009 /*due to King Abdullah's dismissal of the parliament and his announcement that elections would not be held until the end of 2010*/


/* Kenya in 1993 disputed election and suspended parliament after election */
replace reason="parliament suspended" if country=="Kenya" & year==1993 /*rising violence and the government's disregard for the legitimacy of opposition parlies and parliamentary power */
replace reason="parliament suspended" if country=="Kuwait" & year==1976 /* Emir suspended parliament for 4 years */
replace reason="term limits" if country=="Lebanon" & year==1995 
/* "because parliament arbitrarily amended the constitution to extend the president's term and */
/*the government is  increasingly  marginalizing  the  Christian community */

replace reason="not clear" if country=="Lesotho" & year==1988 
replace reason="insurgence and conflict" if country=="Lesotho" & year==2015 /* due to continued instability */
replace reason="came in a coup" if country=="Liberia" & year==1980 
replace reason="insurgence and conflict" if country=="Liberia" & year==1989  /* civil war begins */
replace reason="came in a coup" if country=="Mauritania" & year==2008  /* not takeover */ 
replace reason="rights abuses, various" if country=="Mozambique" & year==1993  /* not takeover, intensified human rights violations by both the government and RENAMO forces and a delay in the democratic transition */
replace reason="came in coup" if country=="Niger" & year==1996 /* not takeover */ 
replace reason="came in coup" if country=="Nigeria" & year==1993 /* not takeover */ 
replace reason="not clear" if country=="Oman" & year==1993 /* not takeover, change as a result of change in methodology */
replace reason="came in coup" if country=="Pakistan" & year==1999 /* not takeover,  */
replace reason="concentration of power" if country=="Qatar" & year==1989 /* not certain but reorganisation of power and ministerial reshuffle */
replace reason="concentration of power" if country=="Sao Tome and Principe" & year==1977 /* not certain but 77-78 purge of elites, then attempted coup in 1978 and further purges */
/* NB Stewart Lloyd-Jones, António Costa Pinto: The last empire: thirty years of Portuguese decolonization */
replace reason="disputed election" if country=="Senegal" & year==2019 
/*Sen 2019 presidential election was marred by the exclusion of two major opposition figures who had been convicted in politically fraught corruption cases */
replace reason="concentration of power" if country=="Serbia" & year==2018
/* also - President Aleksandar Vu?i?’s de facto accumulation of executive powers that conflict with his constitutional role */
replace reason="came in coup" if country=="Sierra Leone" & year==1992 /* not takeover */
replace reason="came in coup" if country=="Sierra Leone" & year==1997 /* not takeover */


replace reason="came in coup" if country=="Sudan" & year==1989 /* not takeover */
replace reason="insurgence and conflict" if country=="Sudan" & year==1984 /* declared martial law but civil war so not takeoever */
replace reason="came in coup" if country=="Suriname" & year==1980 /* not takeover */
replace reason="insurgence and conflict" if country=="Suriname" & year==1989 /* not takeover: not clear but probably civil conflict and continuing military ifluence */
replace reason="disputed election" if country=="Swaziland" & year==1993 /*because of a disappointing election  and  increased human  rights  abuses */
replace reason="insurgence and conflict" if country=="Syria" & year==1980 /* rebellion in Aleppo */
replace reason="insurgence and conflict" if country=="Tajikistan" & year==1992 /* not takeover */
replace reason="rights abuses, various" if country=="Tanzania" & year==1993 /* because of communal tensions and restrictions on the oppostion. */
replace reason="came in coup" if country=="Thailand" & year==1976 /* students massacre, coup, military makes him PM */
replace reason="came in coup" if country=="Thailand" & year==2006 
replace reason="came in coup" if country=="Thailand" & year==2014 /*due to the May military coup, whose leaders abolished the 2007 constitution and imposed severe restrictions */
replace reason="disputed election" if country=="Togo" & year==2002 /*due to the holding of legislative elections that were neither free nor fair */
replace reason="disputed election" if country=="Trinidad and Tobago" & year==2001 /* due to a virtual breakdown in the parliamentary system as a result of two disputed national elections, growing corruption, and continued problems with the police*/
replace reason="not clear" if country=="Tunisia" & year==1993 /* not takeover, change as a result of change in methodology */
replace reason="not clear" if country=="Tunisia" & year==1998 /* not takeover, report does not mention specifics, lots of things */
replace reason="rights abuses, various" if country=="Uganda" & year==2014  /* not takeover */
/* Uganda 2014 due to increased violations of individual rights and the freedoms of expression, assembly, and association, particularly */
/* for opposition supporters, civil society groups, women, and the LGBT community */
replace reason="not clear" if country=="United Arab Emirates" & year==1993 /* not takeover, change as a result of change in methodology */
replace reason="not clear" if country=="United Arab Emirates" & year==1989 /* not clear, nothing specific */
replace reason="delayed election" if country=="Yemen" & year==2009 /* due to the two-year postponement of parliamentary elections, the renewal of fighting between central authorities and al-Houthi rebels in the north, and an escalation in violence*/
replace reason="insurgence and conflict" if country=="Yemen" & year==1994 /* because of civil war */
replace reason="parliament dismissed" if ruler=="Maduro"  & year==2016
replace reason="concentration of power" if ruler=="Erdogan" /* "due to a deeply flawed constitutional referendum that centralized power in the presidency" */
replace reason="came in coup" if ruler=="Mnangagwa"
replace reason="rights abuses, various" if country=="Nicaragua" & year==2018
replace reason="rights abuses, various" if country=="Uganda" & year==2018
replace reason="insurgence and conflict" if country=="Myanmar" & year==2019
replace reason="not clear" if country=="Cape Verde" & year==1988 /* description of a single party state, not clear */

gen oldreason=reason
replace reason="coup d'etat" if reason=="came in a coup" | reason=="came in coup" | reason=="coup attempts"
replace reason="delayed/disputed election" if reason=="delayed election" | reason=="disputed election"
replace reason="constitution suspended/violated" if reason=="constitution manipulated" | reason=="constitution suspended"
replace reason="numerous reasons" if reason=="not clear" | reason=="various"
replace reason="coup d'etat" if country=="Congo (Brazzaville)" & year==1977


gen reason2=""

replace reason2="coup d'etat" if reason=="removed or ousted" | reason=="coup d'etat"
replace reason2="insurgency and conflict" if  reason=="foreign occupation" | reason=="insurgence and conflict"
replace reason2="delayed/disputed election" if reason=="delayed/disputed election"
replace reason2="crime and corruption" if reason=="violence and crime"
replace reason2="numerous reasons" if reason=="numerous reasons"
replace reason2="rights abuses, various" if reason=="rights abuses, various"
replace reason2="concentration of power" if reason2==""


save Figure2/fh2020, replace






/* Figure of Status Changes */

tab reason2
tab reason2 if change=="F to PF"
tab reason2 if change=="F/PF to NF"

tab reason2, sort gen(cats)
replace cats1=. if cats1==0
replace cats2=. if cats2==0
replace cats3=. if cats3==0
replace cats4=. if cats4==0
replace cats5=. if cats5==0
replace cats6=. if cats6==0
replace cats7=. if cats7==0
ren cats1 coup 
ren cats2 power
ren cats3 conflict
ren cats4 rights 
ren cats5 election
ren cats6 crime
ren cats7 various

collapse (count) coup power conflict rights election crime various, by(change) 
/* transpose in excel*/
clear



/* use fh_cats
label define changecats 1 "coup d'etat" 2 "concentration of power" 3 "insurgency and conflict" ///
4 "civil rights violations" 5 "delayed/disputed election" 6 "crime or corruption"  7 "numerous reasons"
label values changecats changecats


gen depvar0=fpftonf
gen depvar1=ftopf

gen depvar2 = -depvar1graph hbar (asis) depvar0 depvar2,  ///     over(changecats,  label(labsize(small))) ///     ylabel(   -20 "20" -10 "10" 0 "0" ///            10 "10" 20 "20" 30 "30", labsize(vsmall)) ///             bargap(-100)  ysize(4) xsize(5) scheme(s1mono) bar(1,color(black)) ///             legend(order(2 1) label(1 "from PF/F to NF") label(2 "from F to PF") ///             size(small) region(lstyle(none))) 
graph save fh_takeovers/freedomhouse_cats.pdf, replace */


clear
use Figure2/fh2020

gen takeover=.
replace takeover=1 if reason2=="concentration of power"
keep if takeover==1
save Figure2/fh_takeovers, replace

keep if takeover==1
save Figure2/fh_takeovers, replace













