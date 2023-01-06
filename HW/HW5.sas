/**READ ALL THE DATA SETS**/
data ONE;
infile "\\Client\C$\Users\nhivutu\Desktop\Math338\data\ONE.txt";
input ID  SEX $  DOB mmddyy8. SALARY ;
run;
data TWO;
infile "\\Client\C$\Users\nhivutu\Desktop\Math338\data\TWO.txt";
input IDNUM SEX $  DOB mmddyy8. SALARY TAXRATE WITHHOLD;
run;
data THREE;
infile  "\\Client\C$\Users\nhivutu\Desktop\Math338\data\THREE.txt";
input ID  SEX $   DOB mmddyy8.  SALARY HEIGHT WEIGHT;
run;

/**CREAT A DATA FOR ALL**/
data all (keep= ID DOB SALARY);
merge ONE TWO (rename=(IDNUM=ID)) THREE;
by ID;
run;
proc print data=all;
title "The data set for all";
format ID z2. DOB mmddyy8. SALARY dollar22.;
run;
/**CREAT A DATA FOR ALL**/
data newList;
set all;
if DOB <=  01/ 1/60 and SALARY >=50000 then output;
run;
proc print data=newList;
format ID z2. DOB mmddyy8. SALARY dollar22.;
run;
