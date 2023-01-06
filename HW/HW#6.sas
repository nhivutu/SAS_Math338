
/****HW6**Nhi**Vu****/
data HW6;
infile '\\Client\H$\Desktop\Math338\data\HW6.txt';
input  ID 1-3 GENDER $4 PARTY 5 VOTE 6 FOREIGN 7 SPEND 8;
label ID="Subject identifier"
	  PARTY="Political party"
	  VOTE="Did you vote in the last election?"
	  FOREIGN ="Do you agree with the government’s foreign policy?"
	  SPEND="Should we increase domestic spending?";
run;
proc format;
value $gender 'M'= "Male"
			 'F'= "Female"
			 Other ="N/A";
value part  1 = "Republican"
			2 = "Democrat"
			3 = "Not registered"
	       Other ="N/A";

value vote    0 = "No"  1 = "Yes"  Other ="N/A";
value foreign 0 = "No"  1 = "Yes"  Other ="N/A";
value spend   0= "No"  1 = "Yes"   Other ="N/A";
run;
proc print data=HW6 label;
format ID z3. GENDER $gender. PARTY part. VOTE vote. FOREIGN foreign. SPEND spend.;
title "Homework #6";
run;
quit;
