********************************************************************************
* Replication Code for "Gender Segregation and Decision-Making in Undergraduate Course-Taking"
* Authors: Thompson, Dalberg, Bruch
* Initialized: Oct 2019 | Finalized: Sept 2024
********************************************************************************


********************************************************************************
* Notes 
********************************************************************************

* Inputs: 
*  	course_characteristics.dta (unavailable due to privacy restrictions)


********************************************************************************
* Setting up data and globals  
********************************************************************************

** All analyses were run using Stata 17

clear all
macro drop _all 
set more off 

version 17 
set matsize 5000
pause on

set scheme burd

*** Set seeds and sortseed 
set seed 10027
set sortseed 10027

**** Globals (users will need to replace)
global dir //** SET DIR HERE**// 

global data "${dir}/Data/" // unavailable due to privacy restrictions
global output "${dir}/_post/output"
global syntax "${dir}/_post"
cd "${dir}/_post/"

capture mkdir "${output}/temp"

**** Install necessary packages 
local packages estout desctable coefplot mkspline 

foreach package in `packages' {
	capture : which `package'
	if (_rc) {
		display as result in smcl `"Please install `package' in order to run this syntax"'
		exit 199
	}
}

***********************************
* Date global 
***********************************

*makes date in numeric year_month_day format for file version control 

quietly {
	global date=c(current_date)

	***day
	if substr("$date",1,1)==" " {
		local val=substr("$date",2,1)
		global day=string(`val',"%02.0f")
	}
	else {
		global day=substr("$date",1,2)
	}

	***month
	if substr("$date",4,3)=="Jan" {
		global month="01"
	}
	if substr("$date",4,3)=="Feb" {
		global month="02"
	}
	if substr("$date",4,3)=="Mar" {
		global month="03"
	}
	if substr("$date",4,3)=="Apr" {
		global month="04"
	}
	if substr("$date",4,3)=="May" {
		global month="05"
	}
	if substr("$date",4,3)=="Jun" {
		global month="06"
	}
	if substr("$date",4,3)=="Jul" {
		global month="07"
	}
	if substr("$date",4,3)=="Aug" {
		global month="08"
	}
	if substr("$date",4,3)=="Sep" {
		global month="09"
	}
	if substr("$date",4,3)=="Oct" {
		global month="10"
	}
	if substr("$date",4,3)=="Nov" {
		global month="11"
	}
	if substr("$date",4,3)=="Dec" {
		global month="12"
	}

	***year
	global year=substr("$date",8,4)

	global date="$year"+"_"+"$month"+"_"+"$day"
}

dis "$date"


********************************************************************************
* Load data 
********************************************************************************

use "${data}/course_consideration.dta", clear


********************************************************************************
* Run Do Files 
********************************************************************************


do "${syntax}/A_descriptives.do"
do "${syntax}/B_segregation_decomp.do"
do "${syntax}/C_AME_table.do"
do "${syntax}/D_all_course_attributes.do"
do "${syntax}/E_kanter.do"
