/****** PART 1 ** Nhi Vu *****/
*Generate 961 samples of size 625 random numbers from Beta distribution;
option nodate;
%let ns = 625; /* sample size */
%let n = 961; /* Number of samples*/

data Q1data;
call streaminit(0);
do SampleID = 1 to &n;      /* ID variable for each sample*/
sum=0;
mean=0;
do i = 1 to &ns;
x = rand("beta",0.5,0.5);   /*Sample from Beta distribution*/
sum=sum+x;
mean=sum/&ns;
end;
output;
end;
run;
proc print data=Q1data;
var mean;
run;

/****** PART 1a) ** Nhi Vu *****/

* the simulated probability that the mean is between 0.49 and 0.51;

data a;
set Q1data (keep=mean);
do i=1 to &n;
if mean > 0.49 and mean <0.51 then count=1;
else count=0;
prob=count/&n;
end;
run;
proc means data=a sum;
title "Question 1.a";
var count prob;
run;

/****** PART 1b) ** Nhi Vu *****/
* Find the simulated mean of the means;
proc means data=Q1data mean;
title "Question 1.b:The simulated mean of the means ";
var mean;
run;

/****** PART 1c) ** Nhi Vu *****/
* Find the standard deviation of the means;
proc means data=Q1data std;
title "Question 1.c:The standard deviation of the means";
var mean;
run;

/****** PART 2d) ** Nhi Vu *****/
* Draw the histogram of the means;

ods select Histogram;
proc univariate data=Q1data;
title "Question 1.d:Distribution of Sample Mean";
histogram mean / normal ; 
run;
quit;
