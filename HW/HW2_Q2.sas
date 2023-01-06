/****** PART 2 ** Nhi Vu *****/
*Generate 961 samples of size 625 random numbers from a Pareto distribution ;
option nodate;
%let ns = 625; /* sample size */
%let n = 961; /* Number of samples*/

data Q2data;
call streaminit(0);
do SampleID = 1 to &n;      /* ID variable for each sample*/
do i = 1 to &ns;
x = rand('pareto',5);   /*Sample from Pareto distribution*/
output;
end;
end;
run;

* Calculating mean for each sample;
proc means data=Q2data noprint;
by SampleID;
var x;
output out=SummaryStat mean=SampleMean;
run;
proc contents data=SummaryStat;
title "Dataset of mean for 961 samples";
run;
/****** PART 2a) ** Nhi Vu *****/

* the simulated probability that the mean is between 1.25 and 1.26;

data a;
set SummaryStat (keep=SampleMean);
do i=1 to &n;
if SampleMean > 1.25 and SampleMean <1.26 then count=1;
else count=0;
prob=count/&n;
end;
run;
proc means data=a sum;
title "Question 2.a ";
var count prob;
run;
/****** PART 2b) ** Nhi Vu *****/
* Find the simulated mean of the means;
proc means data=SummaryStat mean;
title "Question 2.b:The simulated mean of the means ";
var SampleMean;
run;

/****** PART 2c) ** Nhi Vu *****/
* Find the standard deviation of the means;
proc means data=SummaryStat std;
title "Question 2.c:The standard deviation of the means";
var SampleMean;
run;

/****** PART 2d) ** Nhi Vu *****/
* Draw the histogram of the means;

ods select Histogram;
proc univariate data=SummaryStat;
title "Question 2.d:Distribution of Sample Mean";
histogram SampleMean / normal ; 
run;
quit;
