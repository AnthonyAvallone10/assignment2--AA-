//Clear the memory 

clear

//Close log previously open 

capture log close 

//Import the CSV penguins file 

import delimited "C:\Users\aavallone\Downloads\penguins.csv"

//Clean data, drop rows with NA or missing value 

drop if bill_length_mm=="NA"

drop if sex=="NA"

//Start the log 

log using "penguin_output.log" , replace text

//Destring variables to make them numeric 

destring bill_depth_mm, replace 

destring flipper_length_mm, replace

destring body_mass_g, replace 

//Descriptive analysis 1, summary statistics for the different species 

by species, sort : summarize bill_depth_mm flipper_length_mm body_mass_g year

//Descriptive analysis 2, summary statistics for the different islands 

by island, sort : summarize bill_depth_mm flipper_length_mm body_mass_g year

//Descriptive analysis 3, summary statistics for the different sex 

by sex, sort : summarize bill_depth_mm flipper_length_mm body_mass_g year

//Additional analysis for step 3 

mean bill_depth_mm flipper_length_mm body_mass_g

//Close the log 

log close
