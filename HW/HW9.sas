
options linesize=68 nonumber nodate;
/***Import Data**Nhi Vu***/
PROC IMPORT OUT = temp
DATAFILE= "\\Client\H$\Desktop\Math338\data\HW9.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
RUN;
proc contents data=temp;
run;

/***Create Data Set For HW9**Nhi Vu***/
data HW9;
set temp;
*Change missing value to 0;
array score(*) Q1-Q9 H1-H14 T1-T3;
do i =1 to dim (score);
	 if score[i] = . then score[i] = 0;
end;
*Drop the lowest 2 and calucalate to percentage;
call sortn(of Q1-Q9);
    Q = mean(of Q3-Q9)*100/10;
call sorth(of H1-H14);
	H = mean(of H3-H14)*100/10;

Total = 0.25*(T1 + T2 + T3) + 0.15*max(H,Q) + 0.10*min(H,Q);
label First="First name"
	  Last="Last name"
	  Q = "Quiz (%)"
	  H = "Homework (%)"
	  T1= "Test 1 (%)"
	  T2= "Test 2 (%)"
	  T3= "Test 3 (%)"
	  Total= "Final grade (%) and leter grade"
	;
drop Q1-Q9 H1-H14  i;
run;

proc format;
picture g
90-100   = '000.00% ' ' A '
87- <90  = '00.00% ' ' A-'
84-<87	 = '00.00% ' ' B+'
80-<84   = '00.00% ' ' B '
75-<80   = '00.00% ' ' B-'
68-<75   = '00.00% ' ' C+'
55-<68   = '00.00% ' ' C '
50-<55   = '00.00% ' ' C-'
40-<50   = '00.00% ' ' D '
0-<40    = '00.00% ' ' F ';
picture mypct (round) low-high='009.99%';
 run;

proc print data=HW9 label;
format Total g.  Q  H T1-T3 mypct. ;
title "Homework 9 - The student's grade";
var First Last Q  H T1-T3 Total;
run;
