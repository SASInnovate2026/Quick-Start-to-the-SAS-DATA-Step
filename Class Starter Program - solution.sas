/*Create SCHOOL library to access CLASS data*/
%let path=/home/student/workshop/QuickStartDATAStep;
libname school "&path";

/*Clean CLASS data*/
data year9 year10 year11 year12;
	set school.class;
	where Status="Enrolled";
	*keep LastName FirstName Sex Year DOB Test1 Test2;
	drop Status;
	format DOB mmddyy.;
	Sex=upcase(Sex);
	*Avg=(Test1+Test2)/2;
	Avg=mean(Test1, Test2);
	if Avg<80;
	*output;
	if Year=9 then output year9;
	else if Year=10 then output year10;
	else if Year=11 then output year11;
	else output year12;
run;