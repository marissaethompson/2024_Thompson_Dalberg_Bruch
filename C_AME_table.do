


*************************** 
* Table 5 - Single and Multi-Stage Models 
*************************** 

******* Gender Specific Models 


** AME Men - Naive 
preserve 
	estimates clear 
	eststo clear 

	keep if female ==0 
	replace enrolled = 0 if enrolled ==. & viewed==0 

	xtlogit enrolled ///
		c.catalog_number_clean_std##c.catalog_number_clean_std ///
		c.course_gpa_std##c.course_gpa_std ///
		c.num_students_std##c.num_students_std  ///
		c.mean_score_std##c.mean_score_std ///
		c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
		c.num_prereq_std##c.num_prereq_std ///
		c.num_after_std##c.num_after_std ///
		c.unit_avg_std##c.unit_avg_std ///
		c.share_female_std##c.share_female_std ///
		c.degree_share_female##c.degree_share_female ///
		i.stem, fe i(student_id_num)
	
	eststo naive: margins, dydx(share_female_std) post 
restore 

** AME Men - Multi 

preserve

	keep if female==0

	keep if viewed==1 | viewed==0
	
	xtlogit viewed ///
		c.catalog_number_clean_std##c.catalog_number_clean_std ///
		c.course_gpa_std##c.course_gpa_std ///
		c.num_students_std##c.num_students_std  ///
		c.mean_score_std##c.mean_score_std ///
		c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
		c.num_prereq_std##c.num_prereq_std ///
		c.num_after_std##c.num_after_std ///
		c.unit_avg_std##c.unit_avg_std ///
		c.share_female_std##c.share_female_std ///
		c.degree_share_female_std##c.degree_share_female_std ///
		i.stem ,  fe i(student_id_num)

	eststo view: margins, dydx(share_female_std) post 


	xtlogit enrolled ///
		c.catalog_number_clean_std##c.catalog_number_clean_std ///
		c.course_gpa_std##c.course_gpa_std ///
		c.num_students_std##c.num_students_std  ///
		c.mean_score_std##c.mean_score_std ///
		c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
		c.num_prereq_std##c.num_prereq_std ///
		c.num_after_std##c.num_after_std ///
		c.unit_avg_std##c.unit_avg_std ///
		c.share_female_std##c.share_female_std ///
		c.degree_share_female_std##c.degree_share_female_std ///
		i.stem if viewed==1,  fe i(student_id_num)


	eststo enroll: margins, dydx(share_female_std) post 


	esttab using "${output}/table5_men_$date.csv", obslast se nogaps label noomitted replace compress star(* 0.05 ** 0.01 *** 0.001) b(%9.2f)

restore 

** AME Women - Naive 
preserve 
	eststo clear 
	estimates clear 

	keep if female ==1
	replace enrolled = 0 if enrolled ==. & viewed==0 

	xtlogit enrolled ///
		c.catalog_number_clean_std##c.catalog_number_clean_std ///
		c.course_gpa_std##c.course_gpa_std ///
		c.num_students_std##c.num_students_std  ///
		c.mean_score_std##c.mean_score_std ///
		c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
		c.num_prereq_std##c.num_prereq_std ///
		c.num_after_std##c.num_after_std ///
		c.unit_avg_std##c.unit_avg_std ///
		c.share_female_std##c.share_female_std ///
		c.degree_share_female##c.degree_share_female ///
		i.stem, fe i(student_id_num)


	eststo naive: margins, dydx(share_female_std) post 

restore 

** AME Women - Multi 


preserve


	keep if female==1

	keep if viewed==1 | viewed==0
	xtlogit viewed ///
		c.catalog_number_clean_std##c.catalog_number_clean_std ///
		c.course_gpa_std##c.course_gpa_std ///
		c.num_students_std##c.num_students_std  ///
		c.mean_score_std##c.mean_score_std ///
		c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
		c.num_prereq_std##c.num_prereq_std ///
		c.num_after_std##c.num_after_std ///
		c.unit_avg_std##c.unit_avg_std ///
		c.share_female_std##c.share_female_std ///
		c.degree_share_female_std##c.degree_share_female_std ///
		i.stem,  fe i(student_id_num) 


	eststo view: margins, dydx(share_female_std) post 


	xtlogit enrolled ///
		c.catalog_number_clean_std##c.catalog_number_clean_std ///
		c.course_gpa_std##c.course_gpa_std ///
		c.num_students_std##c.num_students_std  ///
		c.mean_score_std##c.mean_score_std ///
		c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
		c.num_prereq_std##c.num_prereq_std ///
		c.num_after_std##c.num_after_std ///
		c.unit_avg_std##c.unit_avg_std ///
		c.share_female_std##c.share_female_std ///
		c.degree_share_female_std##c.degree_share_female_std ///
		i.stem if viewed==1,  fe i(student_id_num)


	eststo enroll: margins, dydx(share_female_std) post 

	esttab using "${output}/table5_women_$date.csv", obslast se nogaps label noomitted replace compress star(* 0.05 ** 0.01 *** 0.001) b(%9.2f)

restore


*************************** 
* Appendix - Single and Multi-Stage Models - W/O STEM & Degree 
*************************** 

** AME Men - Naive 
preserve 
	estimates clear 
	eststo clear 

	keep if female ==0 
	replace enrolled = 0 if enrolled ==. & viewed==0 

	xtlogit enrolled ///
		c.catalog_number_clean_std##c.catalog_number_clean_std ///
		c.course_gpa_std##c.course_gpa_std ///
		c.num_students_std##c.num_students_std  ///
		c.mean_score_std##c.mean_score_std ///
		c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
		c.num_prereq_std##c.num_prereq_std ///
		c.num_after_std##c.num_after_std ///
		c.unit_avg_std##c.unit_avg_std ///
		c.share_female_std##c.share_female_std ///
		, fe i(student_id_num)
	 

	eststo naive: margins, dydx(share_female_std) post 
restore 

** AME Men - Multi 

preserve

	keep if female==0

	keep if viewed==1 | viewed==0
	xtlogit viewed ///
		c.catalog_number_clean_std##c.catalog_number_clean_std ///
		c.course_gpa_std##c.course_gpa_std ///
		c.num_students_std##c.num_students_std  ///
		c.mean_score_std##c.mean_score_std ///
		c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
		c.num_prereq_std##c.num_prereq_std ///
		c.num_after_std##c.num_after_std ///
		c.unit_avg_std##c.unit_avg_std ///
		c.share_female_std##c.share_female_std ///
		, fe i(student_id_num)


	eststo view: margins, dydx(share_female_std) post 


	xtlogit enrolled ///
		c.catalog_number_clean_std##c.catalog_number_clean_std ///
		c.course_gpa_std##c.course_gpa_std ///
		c.num_students_std##c.num_students_std  ///
		c.mean_score_std##c.mean_score_std ///
		c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
		c.num_prereq_std##c.num_prereq_std ///
		c.num_after_std##c.num_after_std ///
		c.unit_avg_std##c.unit_avg_std ///
		c.share_female_std##c.share_female_std ///
		if viewed==1, fe i(student_id_num)


	eststo enroll: margins, dydx(share_female_std) post 


	esttab using "${output}/main_nodegree_nostem_men_$date.csv", obslast se nogaps label noomitted replace compress star(* 0.05 ** 0.01 *** 0.001) b(%9.2f)

restore 


** AME Women - Naive 

preserve 
	eststo clear 
	estimates clear 

	keep if female ==1
	replace enrolled = 0 if enrolled ==. & viewed==0 

	xtlogit enrolled ///
		c.catalog_number_clean_std##c.catalog_number_clean_std ///
		c.course_gpa_std##c.course_gpa_std ///
		c.num_students_std##c.num_students_std  ///
		c.mean_score_std##c.mean_score_std ///
		c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
		c.num_prereq_std##c.num_prereq_std ///
		c.num_after_std##c.num_after_std ///
		c.unit_avg_std##c.unit_avg_std ///
		c.share_female_std##c.share_female_std ///
		, fe i(student_id_num)


	eststo naive: margins, dydx(share_female_std) post 
restore

** AME Women - Multi 


preserve


	keep if female==1

	keep if viewed==1 | viewed==0
	xtlogit viewed ///
		c.catalog_number_clean_std##c.catalog_number_clean_std ///
		c.course_gpa_std##c.course_gpa_std ///
		c.num_students_std##c.num_students_std  ///
		c.mean_score_std##c.mean_score_std ///
		c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
		c.num_prereq_std##c.num_prereq_std ///
		c.num_after_std##c.num_after_std ///
		c.unit_avg_std##c.unit_avg_std ///
		c.share_female_std##c.share_female_std ///
		, fe i(student_id_num)


	eststo view: margins, dydx(share_female_std) post 


	xtlogit enrolled ///
		c.catalog_number_clean_std##c.catalog_number_clean_std ///
		c.course_gpa_std##c.course_gpa_std ///
		c.num_students_std##c.num_students_std  ///
		c.mean_score_std##c.mean_score_std ///
		c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
		c.num_prereq_std##c.num_prereq_std ///
		c.num_after_std##c.num_after_std ///
		c.unit_avg_std##c.unit_avg_std ///
		c.share_female_std##c.share_female_std ///
		if viewed==1, fe i(student_id_num)

	eststo enroll: margins, dydx(share_female_std) post 

	esttab using "${output}/main_nodegree_nostem_women_$date.csv", obslast se nogaps label noomitted replace compress star(* 0.05 ** 0.01 *** 0.001) b(%9.2f)

restore


*************************** 
* Figure 2 - Predicted Probability Plot 
*************************** 

*********
* Men 

eststo clear 
preserve


	keep if female==0

	keep if viewed==1 | viewed==0
	xtlogit viewed ///
		c.catalog_number_clean_std##c.catalog_number_clean_std ///
		c.course_gpa_std##c.course_gpa_std ///
		c.num_students_std##c.num_students_std  ///
		c.mean_score_std##c.mean_score_std ///
		c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
		c.num_prereq_std##c.num_prereq_std ///
		c.num_after_std##c.num_after_std ///
		c.unit_avg_std##c.unit_avg_std ///
		c.share_female##c.share_female ///
		c.degree_share_female_std##c.degree_share_female_std ///
		i.stem,  fe i(student_id_num) 
	margins, at(share_female=(0(0.1)1)) post 
	est store Men



	xtlogit enrolled ///
		c.catalog_number_clean_std##c.catalog_number_clean_std ///
		c.course_gpa_std##c.course_gpa_std ///
		c.num_students_std##c.num_students_std  ///
		c.mean_score_std##c.mean_score_std ///
		c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
		c.num_prereq_std##c.num_prereq_std ///
		c.num_after_std##c.num_after_std ///
		c.unit_avg_std##c.unit_avg_std ///
		c.share_female##c.share_female ///
		c.degree_share_female_std##c.degree_share_female_std ///	
		i.stem if viewed==1,  fe i(student_id_num)
	margins, at(share_female=(0(0.1)1)) post 
	est store me



restore 

*********
* Women

eststo clear 
preserve


	keep if female==1

	keep if viewed==1 | viewed==0
	xtlogit viewed ///
		c.catalog_number_clean_std##c.catalog_number_clean_std ///
		c.course_gpa_std##c.course_gpa_std ///
		c.num_students_std##c.num_students_std  ///
		c.mean_score_std##c.mean_score_std ///
		c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
		c.num_prereq_std##c.num_prereq_std ///
		c.num_after_std##c.num_after_std ///
		c.unit_avg_std##c.unit_avg_std ///
		c.share_female##c.share_female ///
		c.degree_share_female_std##c.degree_share_female_std ///	
		i.stem,  fe i(student_id_num) 
	margins, at(share_female=(0(0.1)1)) post 
	est store Women



	xtlogit enrolled ///
		c.catalog_number_clean_std##c.catalog_number_clean_std ///
		c.course_gpa_std##c.course_gpa_std ///
		c.num_students_std##c.num_students_std  ///
		c.mean_score_std##c.mean_score_std ///
		c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
		c.num_prereq_std##c.num_prereq_std ///
		c.num_after_std##c.num_after_std ///
		c.unit_avg_std##c.unit_avg_std ///
		c.share_female##c.share_female ///
		c.degree_share_female_std##c.degree_share_female_std ///	
		i.stem if viewed==1,  fe i(student_id_num)
	margins, at(share_female=(0(0.1)1)) post 
	est store we

				   
	coefplot Men Women, at  recast(line) saving("${output}/temp/multistage_view_prob", replace) ylabel(0(0.2)1, nogrid) yscale(range(0(0.2)1)) ///
		ytitle("Predicted 	Probability of Course View", size(small)) graphregion(color(white)) legend(size(vsmall) nobox region(lstyle(none)))

	coefplot me we, at  recast(line) saving("${output}/temp/multistage_enroll_prob", replace) ylabel(0(0.2)1, nogrid) yscale(range(0(0.2)1)) ///
		ytitle("Predicted Probability of Course Enroll (Conditional on View)", size(small)) xtitle("Course Share Women") nokey graphregion(color(white)) 


	grc1leg "${output}/temp/multistage_view_prob" "${output}/temp/multistage_enroll_prob", cols(1) xcommon graphregion(color(white)) xsize(2.5) ysize(2.7) position(11) 
	graph export "${output}/probability_course_share_$date.png", replace

restore

*************************** 
* Appendix Figure - Predicted Probability Plot (W/O Degree and STEM)
*************************** 

estimates clear 
eststo clear 

*********
* Men 

eststo clear 
preserve


	keep if female==0

	keep if viewed==1 | viewed==0
	xtlogit viewed ///
		c.catalog_number_clean_std##c.catalog_number_clean_std ///
		c.course_gpa_std##c.course_gpa_std ///
		c.num_students_std##c.num_students_std  ///
		c.mean_score_std##c.mean_score_std ///
		c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
		c.num_prereq_std##c.num_prereq_std ///
		c.num_after_std##c.num_after_std ///
		c.unit_avg_std##c.unit_avg_std ///
		c.share_female##c.share_female ///
		,  fe i(student_id_num) 
	margins, at(share_female=(0(0.1)1)) post 
	est store Men



	xtlogit enrolled ///
		c.catalog_number_clean_std##c.catalog_number_clean_std ///
		c.course_gpa_std##c.course_gpa_std ///
		c.num_students_std##c.num_students_std  ///
		c.mean_score_std##c.mean_score_std ///
		c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
		c.num_prereq_std##c.num_prereq_std ///
		c.num_after_std##c.num_after_std ///
		c.unit_avg_std##c.unit_avg_std ///
		c.share_female##c.share_female ///
		if viewed==1,  fe i(student_id_num)
	margins, at(share_female=(0(0.1)1)) post 
	est store me



restore 

*********
* Women

eststo clear 
preserve


	keep if female==1

	keep if viewed==1 | viewed==0
	xtlogit viewed ///
		c.catalog_number_clean_std##c.catalog_number_clean_std ///
		c.course_gpa_std##c.course_gpa_std ///
		c.num_students_std##c.num_students_std  ///
		c.mean_score_std##c.mean_score_std ///
		c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
		c.num_prereq_std##c.num_prereq_std ///
		c.num_after_std##c.num_after_std ///
		c.unit_avg_std##c.unit_avg_std ///
		c.share_female##c.share_female ///
		,  fe i(student_id_num) 
	margins, at(share_female=(0(0.1)1)) post 
	est store Women



	xtlogit enrolled ///
		c.catalog_number_clean_std##c.catalog_number_clean_std ///
		c.course_gpa_std##c.course_gpa_std ///
		c.num_students_std##c.num_students_std  ///
		c.mean_score_std##c.mean_score_std ///
		c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
		c.num_prereq_std##c.num_prereq_std ///
		c.num_after_std##c.num_after_std ///
		c.unit_avg_std##c.unit_avg_std ///
		c.share_female##c.share_female ///
		if viewed==1,  fe i(student_id_num)
	margins, at(share_female=(0(0.1)1)) post 
	est store we

				   
	coefplot Men Women, at  recast(line) saving("${output}/temp/multistage_view_prob_a", replace) ylabel(0(0.2)1, nogrid) ///
		yscale(range(0(0.2)1)) ytitle("Predicted Probability of Course View", size(small)) graphregion(color(white)) legend(size(vsmall) nobox region(lstyle(none)))

	coefplot me we, at  recast(line) saving("${output}/temp/multistage_enroll_prob_a", replace) ylabel(0(0.2)1, nogrid) ///
		yscale(range(0(0.2)1)) ytitle("Predicted Probability of Course Enroll (Conditional on View)", size(small)) ///
		xtitle("Course Share Women") nokey graphregion(color(white)) 


	grc1leg "${output}/temp/multistage_view_prob_a" "${output}/temp/multistage_enroll_prob_a", cols(1) xcommon ///
		graphregion(color(white)) xsize(2.5) ysize(2.7) position(11) 
		
	graph export "${output}/probability_course_share_nodegree_nostem_$date.png", replace

restore



*************************** 
* Appendix Figure - Degree Share, not controlling for course share or STEM
*************************** 

estimates clear 
eststo clear 

*********
* Men 

eststo clear 
preserve


	keep if female==0

	keep if viewed==1 | viewed==0
	xtlogit viewed ///
		c.catalog_number_clean_std##c.catalog_number_clean_std ///
		c.course_gpa_std##c.course_gpa_std ///
		c.num_students_std##c.num_students_std  ///
		c.mean_score_std##c.mean_score_std ///
		c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
		c.num_prereq_std##c.num_prereq_std ///
		c.num_after_std##c.num_after_std ///
		c.unit_avg_std##c.unit_avg_std ///
		c.degree_share_female##c.degree_share_female ///	
		,  fe i(student_id_num) 
	margins, at(degree_share_female=(0(0.1)1)) post 
	est store Men



	xtlogit enrolled ///
		c.catalog_number_clean_std##c.catalog_number_clean_std ///
		c.course_gpa_std##c.course_gpa_std ///
		c.num_students_std##c.num_students_std  ///
		c.mean_score_std##c.mean_score_std ///
		c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
		c.num_prereq_std##c.num_prereq_std ///
		c.num_after_std##c.num_after_std ///
		c.unit_avg_std##c.unit_avg_std ///
		c.degree_share_female##c.degree_share_female ///	
		if viewed==1,  fe i(student_id_num)
	margins, at(degree_share_female=(0(0.1)1)) post 
	est store me



restore 

*********
* Women

eststo clear 
preserve


	keep if female==1

	keep if viewed==1 | viewed==0
	xtlogit viewed ///
		c.catalog_number_clean_std##c.catalog_number_clean_std ///
		c.course_gpa_std##c.course_gpa_std ///
		c.num_students_std##c.num_students_std  ///
		c.mean_score_std##c.mean_score_std ///
		c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
		c.num_prereq_std##c.num_prereq_std ///
		c.num_after_std##c.num_after_std ///
		c.unit_avg_std##c.unit_avg_std ///
		c.degree_share_female##c.degree_share_female ///	
		,  fe i(student_id_num) 
	margins, at(degree_share_female=(0(0.1)1)) post 
	est store Women



	xtlogit enrolled ///
		c.catalog_number_clean_std##c.catalog_number_clean_std ///
		c.course_gpa_std##c.course_gpa_std ///
		c.num_students_std##c.num_students_std  ///
		c.mean_score_std##c.mean_score_std ///
		c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
		c.num_prereq_std##c.num_prereq_std ///
		c.num_after_std##c.num_after_std ///
		c.unit_avg_std##c.unit_avg_std ///
		c.degree_share_female##c.degree_share_female ///	
		if viewed==1,  fe i(student_id_num)
	margins, at(degree_share_female=(0(0.1)1)) post 
	est store we

	* Graph 
				   
	coefplot Men Women, at  recast(line) saving("${output}/temp/multistage_view_prob_b", replace) ///
		ylabel(0(0.2)1, nogrid) yscale(range(0(0.2)1)) ytitle("Predicted Probability of Course View", size(small)) ///
		graphregion(color(white)) legend(size(vsmall) nobox region(lstyle(none)))

	coefplot me we, at  recast(line) saving("${output}/temp/multistage_enroll_prob_b", replace) ylabel(0(0.2)1, nogrid) ///
		yscale(range(0(0.2)1)) ytitle("Predicted Probability of Course Enroll (Conditional on View)", size(small)) ///
		xtitle("Course Share Women") nokey graphregion(color(white)) 


	grc1leg "${output}/temp/multistage_view_prob_b" "${output}/temp/multistage_enroll_prob_b", cols(1) xcommon ///
		graphregion(color(white)) xsize(2.5) ysize(2.7) position(11) saving("${output}/temp/probability_degree_appendix_$date", replace)
	
	graph export "${output}/probability_degree_appendix_$date.png", replace

restore

