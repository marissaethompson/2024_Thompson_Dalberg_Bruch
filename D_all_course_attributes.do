*************************** 
* Figure 3 - All Course Attributes 
***************************  

estimates clear 
eststo clear 


** Men 
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

	estat ic 

	eststo: margins, dydx(catalog_number_clean_std course_gpa_std num_students_std mean_score_std ///
		adjusted_avg_hrs_std num_prereq_std num_after_std unit_avg_std share_female_std ///
		degree_share_female_std stem) post saving("${output}/temp/file1_md", replace)
	
	estimates store m1 


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

	estat ic 

	eststo: margins, dydx(catalog_number_clean_std course_gpa_std num_students_std mean_score_std ///
		adjusted_avg_hrs_std num_prereq_std num_after_std unit_avg_std share_female_std ///
		degree_share_female_std stem) post  saving("${output}/temp/file2_md", replace)
		
	estimates store m2 

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
		c.share_female_std##c.share_female_std ///
		c.degree_share_female_std##c.degree_share_female_std ///
		i.stem,  fe i(student_id_num) 
	estat ic

	eststo: margins, dydx(catalog_number_clean_std course_gpa_std num_students_std mean_score_std ///
		adjusted_avg_hrs_std num_prereq_std num_after_std unit_avg_std share_female_std ///
		degree_share_female_std stem)  post saving("${output}/temp/file1_wd", replace)
		
	estimates store w1


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

	estat ic 

	eststo: margins, dydx(catalog_number_clean_std course_gpa_std num_students_std mean_score_std ///
		adjusted_avg_hrs_std num_prereq_std num_after_std unit_avg_std  share_female_std degree_share_female_std stem) ///
		post  saving("${output}/temp/file2_wd", replace)
	estimates store w2


restore

coefplot m1 w1, bylabel(Consideration) ||  ///
	(m2, label(Men)) (w2, label(Women)), bylabel(Choice) ///
	drop(_cons) xline(0) recast(bar) ciopts(recast(rcap)) citop barwidt(0.3) ///
	saving("${output}/figure3", replace) graphregion(fcolor(white)) 
	
graph export "${output}/figure3_$date.png", replace
