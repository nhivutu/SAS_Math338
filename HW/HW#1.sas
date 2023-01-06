
/***** 1A ** Nhi Vu *****/
libname datain "\\Client\C$\Users\nhivutu\Downloads";
pattern color= brown;
/***** 1A-i ** Nhi Vu *****
*The frequency of the regions;
proc gchart data= datain.HW1;
vbar region;
run;
/***** 1A-ii ** Nhi Vu *****
*The percentage of visits;
proc gchart data= datain.HW1;
pie visits/discrete  type= percent;
run;
/***** 1A-iii ** Nhi Vu *****
*The frequency of visits for each region;
proc gchart data= datain.HW1;
vbar visits /discrete space=0 group = region ;
run;
/***** 1A-iv ** Nhi Vu *****
*The frequency of regions for each visit;
proc gchart data= datain.HW1;
block region/group= visits;
run;
/***** 1A-v ** Nhi Vu *****
*The sum of sales for each region;
proc gchart data= datain.HW1;
donut region / sumvar = sale;
run;
/***** 1A-vi ** Nhi Vu *****
*The sum of expenses for each region;
proc gchart data= datain.HW1;
pie region /  sumvar = expenses;
run;
/***** 1A-vii ** Nhi Vu *****
proc gchart data= datain.HW1;
*The block chart of mean of sale for each region by visit;
block region / group = visits sumvar = sale type = mean;
run;
/***** 1B-i ** Nhi Vu *****
*Find and print Only North east Region – All variables;
proc print data= datain.HW1 label noobs;
by region;
where region='Northeast'; 
run;
/***** 1B-ii ** Nhi Vu *****
*Find and print Number of Visits from Regional manager is not 5 – All variables;
proc sort data=datain.HW1;
by visits;
proc print data= datain.HW1 label noobs;
id visits;
where visits < 5;
run; 
/***** 1B-iii ** Nhi Vu *****
*Gross Sales for Last Quarter is larger than 700000 and Advertising Expenses for Last
 Quarter is less than 5000 – All variables;
data datain.temp0;
set datain.HW1;
if sale> 700000 && expenses < 5000 then output;
run;
proc print data= datain.temp0 label noobs;
run;
/***** 1B-iv ** Nhi Vu *****
*Only Southeast Region – State name and Region;
proc print data=datain.HW1 label noobs;
where region="Southeast";
var region state;
run;
/***** 1B-v ** Nhi Vu *****
*All States except the ones that start with M and N and T;
data datain.temp1;
set datain.HW1;
if state =: 'M'or state =:'N' or state =:'T' then delete;
run;
proc sort data=datain.temp1;
by state;
proc print data=datain.temp1 label noobs;
var state;
run;
/***** 1C-i ** Nhi Vu *****/
*For each region, how many salesmen are in each state, what are the advertising 
expenditures for each state (in ascending order), and what is the total advertising
expenditure for the region; 
proc sort data=datain.HW1;
by region descending expenses;
proc print data=datain.HW1 label noobs;
by region;
id state;
sum expenses;
var salesman sale expenses;
run; 
/***** 1C-ii ** Nhi Vu *****/
*How many states were visited 1, 2, 3, 4, and 5 times by their regional manager?;
proc freq data=datain.HW1;
table visits;
run;
quit;
