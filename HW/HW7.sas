/***Nhi_Vu**Read_a data***/
data HW7;
infile '\\Client\H$\Desktop\Math338\data\HW7.txt';
input  se 5 ID 6-7  @8 n $ ;
if se  = 1 then input #2 Quiz1-Quiz6 #3 HW1-HW3;
if se  = 3 then input #2 HW1-HW4 #3 Quiz1-Quiz7 ;
label se="Section"
	  ID= "ID student"
	  n="Student Name"; 
run;
proc print data=HW7 label;
format ID z2.;
var se ID n HW1-HW4 Quiz1-Quiz7;
title "M100 for all sections";
run;

/***Nhi_Vu***Data_Set_1****/
data Section1;
infile '\\Client\H$\Desktop\Math338\data\HW7.txt';
file '\\Client\H$\Desktop\Math338\data\M100_Section1.txt';
input se 5 ID $6-7   @8 n $   /;
if se = 1 then do;
	                input  #2 Quiz1-Quiz6  #3 HW1-HW3 ;
					output;
					put #1 ID n #2 Quiz1-Quiz6 #3 HW1-HW3;
                    end;
				    drop se;
 
label ID= "ID student"
	  n="Student Name"; 
run;
proc print data= Section1 label noobs; 
title "M100 section 1";
run;

/***Nhi_Vu***Data_Set_2****/
data Section3;
infile '\\Client\H$\Desktop\Math338\data\HW7.txt';
file '\\Client\H$\Desktop\Math338\data\M100_Section3.txt';
input se 5 ID $6-7 @5  @8 n $ ;
if se = 3 then do;
	              input  #2 HW1-HW4  #3 Quiz1-Quiz7 ;
				  output;
				  put #1 ID n #2 HW1-HW4  #3 Quiz1-Quiz7;
                  end;
				  drop se;
label ID= "ID student"
	  n="Student Name"; 
run;
proc print data= Section3 label noobs; 
title "M100 section 3";
run;
