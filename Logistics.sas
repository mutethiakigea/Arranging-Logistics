proc import datafile='/home/u63491031/C.JEFFERSON/USPresidents.csv'
dbms=csv
out=presidents
replace;
getnames=yes;
run;


proc freq data=presidents;
   tables HomeState / out=freq_output (rename=(count=Number_of_presidents percent=Percent));
   format Percent percent10.2 Cumulative_percent percent10.2;
run;


data freq_output;
   set freq_output;
   Cumulative_freq + Number_of_presidents;
   Cumulative_percent + Percent;
   if Cumulative_percent > 100 then Cumulative_percent = 100;
run;


proc print data=freq_output noobs;
   var HomeState Number_of_presidents Percent Cumulative_freq Cumulative_percent;
   title 'Security Logistics for White House Staff';
run;
