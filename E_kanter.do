*************************** 
* Table 6 -  Kanter 
***************************  


cls 
eststo clear 

mlincom, clear

keep if viewed==1 | viewed ==0 

logit viewed i.female##( ///
	c.catalog_number_clean_std##c.catalog_number_clean_std ///
	c.course_gpa_std##c.course_gpa_std ///
	c.num_students_std##c.num_students_std  ///
	c.mean_score_std##c.mean_score_std ///
	c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
	c.num_prereq_std##c.num_prereq_std ///
	c.num_after_std##c.num_after_std ///
	c.unit_avg_std##c.unit_avg_std ///
	c.share_female##c.share_female ///
	c.degree_share_female##c.degree_share_female ///
	i.stem) , robust 

margins, at(share_female=(.15 .50 .85)) over(female)  post 

qui mlincom 1 - 3 , stat(est se p) add rowname("AME: Men (50 -> 15)")
qui mlincom 5 - 3 , stat(est se p) add rowname("AME: Men (50 -> 85)")


qui mlincom 2 - 4 , stat(est se p) add rowname("AME: Women (50 -> 15)")
qui mlincom 6 - 4 , stat(est se p) add rowname("AME: Women (50 -> 85)")


*Second Difference
	qui mlincom (1 - 3) - (2 - 4), stat(est se p) add rowname("2nd Diff (50 -> 15)" )
	qui mlincom (5 - 3) - (6 - 4), stat(est se p) add rowname("2nd Diff (50 -> 85)" )

mlincom, stat(est se p) title("AMEs for Gender and Test of 2nd Difference")


logit enrolled i.female##( ///
	c.catalog_number_clean_std##c.catalog_number_clean_std ///
	c.course_gpa_std##c.course_gpa_std ///
	c.num_students_std##c.num_students_std  ///
	c.mean_score_std##c.mean_score_std ///
	c.adjusted_avg_hrs_std##c.adjusted_avg_hrs_std ///
	c.num_prereq_std##c.num_prereq_std ///
	c.num_after_std##c.num_after_std ///
	c.unit_avg_std##c.unit_avg_std ///
	c.share_female##c.share_female ///
	c.degree_share_female##c.degree_share_female ///
	i.stem) if viewed==1, robust 

margins,at(share_female=(.15 .50 .85)) over(female)  post 

qui mlincom 1 - 3 , stat(est se p) add rowname("AME: Men (50 -> 15)")
qui mlincom 5 - 3 , stat(est se p) add rowname("AME: Men (50 -> 85)")


qui mlincom 2 - 4 , stat(est se p) add rowname("AME: Women (50 -> 15)")
qui mlincom 6 - 4 , stat(est se p) add rowname("AME: Women (50 -> 85)")


*Second Difference
	qui mlincom (1 - 3) - (2 - 4), stat(est se p) add rowname("2nd Diff (50 -> 15)" )
	qui mlincom (5 - 3) - (6 - 4), stat(est se p) add rowname("2nd Diff (50 -> 85)" )

mlincom, stat(est se p) title("AMEs for Gender and Test of 2nd Difference") decimal(3)

