libname Test "/workspaces/testing/WB_Test1";
libname Input "/workspaces/testing/WB_Test1/Input_Data";
libname Output "/workspaces/testing/WB_Test1/Output_Data";


options validvarname=v7;

proc import datafile="/workspaces/testing/WB_Test1/Amazon.csv"
out=Input.amazon
dbms=csv replace;
run;

proc export data=Input.amazon
outfile="/workspaces/testing/WB_Test1/Output_Data/amazon.csv"
dbms=csv replace;
run;

proc sort data=Input.amazon;
    by Status;
run;

proc print data=Input.amazon;
run;

proc means data=Input.amazon;
    by status;
run;

proc sql;
    create table output.CourierStatus as
select *
from input.amazon
where Courier_Status = "Shipped";
quit;