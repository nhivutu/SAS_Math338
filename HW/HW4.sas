options nodate nonumber  LINESIZE=70;
/****READ ALL THE DATA SETS****/
data employ;
infile '\\Client\C$\Users\nhivutu\Desktop\Math338\data\dataEMPLOY.txt';
informat DOB MMDDYY10.;
input ID Gender $1. DOB;
run;
data part;
infile '\\Client\C$\Users\nhivutu\Desktop\Math338\data\dataParts.txt';
input PART_NO PRICE;
run;
data sale;
infile '\\Client\C$\Users\nhivutu\Desktop\Math338\data\dataSALE.txt';
input ID TRANS PART_NO QUANTITY;
proc sort data=sale;
by PART_NO;
run;
/***CALCULATE THE TOTAL SALE***/
data TotalSale;
merge part sale ( in=s);
by PART_NO;
TOTAL= QUANTITY*PRICE;
informat TOTAL dollar22.2;
if s=1 then output;
run;
/****PART A - MAKE A LISTING SORTED BY ID****/
proc sort data=TotalSale;
by ID;
run;
data List;
merge TotalSale(in=t) employ;
if t=0 then TOTAL=0;
by ID;
run;
/***PRINT A LIST ***/
proc print data=List;
var ID TRANS TOTAL;
format TOTAL dollar22.2;
title "A list of total sales";
run;
/***The total sale for each transaction.***/
proc means data= List sum;
title "The total sale for each transaction. ";
class TRANS;
var TOTAL;
run;

/****PART B****/
proc means data= List sum;
title " Summary of the total sale for each employee";
class ID;
var TOTAL;
run;
/****PART C****/
proc means data= List sum;
title " Summary of the total sale for each gender";
class GENDER;
var TOTAL;
run;
quit;
