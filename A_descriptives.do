********************************************************************************
* Course & student descriptives - Table 1 
********************************************************************************

*** Save table of descriptive *course* information 
desctable share_female degree_share_female ///
	catalog_number_clean course_gpa num_students mean_score adjusted_avg_hrs num_prereq num_after unit_avg stem ///
	, filename("${output}/descriptive_courses_$date") stats(mean sd n) 


egen days_std = std(active_days) 
egen gpa_std = std(latest_cumulative_gpa) 
gen log_days = log(active_days) 


*** Save table of descriptive *student-level* information 
preserve 
	bys student_id: keep if _n==1 
	
	desctable ///
		female latest_cumulative_gpa active_days tot_viewed tot_enrolled stem_student ///
		, filename("${output}/descriptive_students_$date") stats(mean sd n)
		
restore 


** separate descriptive tables by student self-reported gender
preserve 
	bys student_id: keep if _n==1 
	keep if female==0 
	
	desctable ///
		latest_cumulative_gpa active_days tot_viewed tot_enrolled i.stem_student ///
		,  filename("${output}/descriptive_students_male_$date")  stats(mean sd n)
restore 

preserve 
	bys student_id: keep if _n==1 
	keep if female==1
	
	desctable ///
		latest_cumulative_gpa active_days tot_viewed tot_enrolled i.stem_student ///
		,  filename("${output}/descriptive_students_female_$date") stats(mean sd n)
restore 


