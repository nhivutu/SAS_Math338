/***** 1A ** Nhi Vu *****
* Let M = min {n: X1 + X2 + ... + Xn> 1}. Find E(M)=expected value of M ;
data Q1A ;
do j=1 to 10000;  *10000 simulations;
*Find expected value of M for a samples with 10 random value M;
meanM=0;
sumM=0;
do i=1 to 100;     
*Set all initial value at n=0;
 	sum=0;
	M=0; 
   do until (sum>1) ;
      x = rand('uniform');
      sum+x;
      M+1 ;
   end ;
   sumM=sumM+M;
end;
meanM=sumM/100;
output;
end;
run;
 
proc means data=Q1A;
title "The expected value of M";
var meanM;
run;

ods graphics on;
proc sgplot data=Q1A;
series  x = j y = meanM / lineattrs=(color=blue);
refline 2.7 / axis= y lineattrs=(color=red);
title "The behavior of E(M) as iterates inscrease.";
run;
ods graphics off;

/***** 1B ** Nhi Vu *****
* Let N = min (n+1: Xn > Xn+1). Find expected value of  N, E(N) = Mean of N;
data Q1B;
do i=1 to 10000;		   * 10000 simulations;
*Find expected value of M for a samples with 10 random value N;
sumN=0;
do j=1 to 10;
*Set all initial value at n=0;
   N=1;                    
   x = rand('uniform');
   prevX = x;
   do until (prevX > x) ;
      prevX = x;           * remember last x ;
      x = rand('uniform'); * generate new x ;
      N+1 ;
   end;
   sumN=sumN+N;
end;
meanN=sumN/10;
output;
end;
run;
proc means data=Q1B;
title "The expected value of N";
var meanN;
run;
ods graphics on;
proc sgplot data=Q1B;
series  x = i y = meanN / lineattrs=(color=blue);
refline 2.7 / axis= y lineattrs=(color=red);
title "The behavior of N";
run;
ods graphics off;


/***** Q2 ** Nhi Vu *****/
data Q2;
   do i= 1 to 1000;
      x= rand('uniform'); 	* break randomly at any point on one unit stick;
	  if x>0.5 then long=x; * find a long piece;
	  else long=1-x;
	  short=1-long;		 * find a short piece;
	  ratioA=short/long; * for question 2a;
	  ratioB=1/ratioA;   * for question 2b;
      output;
   end;
run;
 proc means data=Q2;
 title "The expected values for question 2";
 var short long ratioA ratioB;
 run;
 ods graphics on;
proc sgplot data=Q2;
series  x = i y = short / lineattrs=(color=blue);
refline 0.25 / axis= y lineattrs=(color=red);
series  x=i y=long / lineattrs=(color=green);
refline 0.75 / axis= y lineattrs=(color=red);
title "The graph for long and short pieces";
run;

proc sgplot data=Q2;
series  x = i y = ratioA / lineattrs=(color=blue);
refline 0.39 / axis= y lineattrs=(color=red);
title "The short piece divided by the long piece ";
run;

proc sgplot data=Q2;
series  x=i y=ratioB / lineattrs=(color=green);
title "The long piece divided by the short piece ";
run;
quit;
