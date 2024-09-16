
*************************** 
* Table 4 - Index of Dissimilarity & Segregation Decomposition 
***************************  


** Consideration 
preserve 
	set matsize 11000

	gen male = 0 
	replace male = 1 if female==0 

	keep if viewed==1
	collapse (sum) female male , by(course) 
	seg female male, d g h x s 

restore

** Choice
preserve
	set matsize 11000

	gen male = 0 
	replace male = 1 if female==0 

	keep if enrolled==1
	collapse (sum) female male , by(course) 
	seg female male, d g h x s 
restore


** Major Level 
preserve
	set matsize 11000

	gen male = 0 
	replace male = 1 if female==0 

	keep major_clean_num female male 
	duplicates drop 
	collapse (sum) female male , by(major_clean_num) 

	seg female male, d g h x s 


restore


******** Segregation Decompositions 

** Consideration 
preserve
	keep if viewed==1

	bys course: egen temp = sum(viewed) if female==1 
	bys course: egen count_female = max(temp)
	drop temp 
	bys course: egen temp = sum(viewed) if female==0 
	bys course: egen count_male = max(temp)

	keep count_female count_male course subject
	duplicates drop 
	reshape long count_, i(course) j(gender, string)
	drop if course=="" 
	gen female = 0 
	replace female = 1 if gender =="female" 
	drop gender 

	dseg theil female [fw=count_], given(course) within(subject) 

restore 

** Choice
preserve
	keep if enrolled==1

	bys course: egen temp = sum(viewed) if female==1 
	bys course: egen count_female = max(temp)
	drop temp 
	bys course: egen temp = sum(viewed) if female==0 
	bys course: egen count_male = max(temp)

	keep count_female count_male course subject stem 
	duplicates drop 
	reshape long count_, i(course) j(gender, string)
	drop if course=="" 
	gen female = 0 
	replace female = 1 if gender =="female" 
	drop gender 

	dseg theil female [fw=count_], given(course) within(subject)

restore 
