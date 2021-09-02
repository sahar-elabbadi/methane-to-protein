Displacing Fishmeal with Protein from Stranded Methane 

Sahar H El Abbadi, Evan D Sherwin, Adam R Brandt, Stephen P Luby, Craig S Criddle

For questions, comments and concerns regarding code, please contact Sahar El Abbadi (elabbadi@stanford.edu)

August 2021

PROJECT SUMMARY: Techno-economic model to evaluate the potential for producing methanotrophic protein from stranded methane in the United States. 

DATA SOURCES: All data used in analysis and figures are publicly available. Data on oil and gas facilities are available through the Earth Observation Group (https://eogdata.mines.edu/download_global_flare.html). All data on methane emissions from oil and gas facilities and landfills, flaring from landfills, and unit processes at wastewater treatment plants are available from the US Environmental Protection Agency through the following programs: Facilities Level Information on Greenhouse Gases Tool (https://ghgdata.epa.gov/ghgp/main.do), Landfill Methane Outreach Program (https://www.epa.gov/lmop/lmop-landfill-and-project-database), and Clean Watersheds Needs Survey for 2004 (https://www.epa.gov/cwns/clean-watersheds-needs-survey-cwns-2004-report-and-data), 2008 (https://www.epa.gov/cwns/clean-watersheds-needs-survey-cwns-2008-report-and-data), and 2012 (https://www.epa.gov/cwns/clean-watersheds-needs-survey-cwns-2012-report-and-data). 

CODE: 
Techno-economic model was created in Analytica. Data from Analytica was used to generate Figures 2b-d, 3, and 5. R was used to generate Figures 2a and the data for Figure 4 using data exported from Analytica. master_data_2021-03-22.xlsx is the output from Analytica used as input for the code used to create Figures 2a and Figure 4. 

Files: 

Methane-Protein_Published.ana is the Analytica code, including techno-economic model, methane source analysis and sensitivity analysis. 

0_config-run.R installs libraries necessary for running code

make_fig_2a.R creates the map of stranded methane sources in the US 

generate-data_fig-4.R generates three data files, which were then plotted in Prism to generate Figure 4. Each file represents the coordinates for cost of methanotrophic protein production and corresponding cumulative protein production, separated by source type (landfills, oil and gas facilities, and wastewater treatment plants) 

Outputs from generate-data_fig-4.R: 
fig4_landfill.txt	# landfills
fig4_nat_gas.txt	# oil and gas facilities
fig4_wwtp.txt		# wastewater treatment plants

