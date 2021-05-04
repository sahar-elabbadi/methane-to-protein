
#generate the CDF curve 
#supply_curve <- make_fig_5.R("master_data_2020-12-31.xlsx")

analytica_df <- read_excel(here("figures", "master_data_2021-03-22.xlsx"))

#replace INF with NA because R doesn't recognize 'INF' 
analytica_df [ analytica_df == 'INF'] <- NA 

#the INF values in certain columns made R import them as characters and not numbers. 
#convert these columns to class numeric

analytica_df$source_id <- as.numeric(analytica_df$source_id)
analytica_df$lat <- as.numeric(analytica_df$lat)
analytica_df$long <- as.numeric(analytica_df$long)
analytica_df$ch4_emissions <- as.numeric(analytica_df$ch4_emission)
analytica_df$scp_cost <- as.numeric(analytica_df$scp_cost)
analytica_df$scp_production <- as.numeric(analytica_df$scp_production)

cost_order <- arrange(analytica_df, scp_cost)

index <- seq (1 : length (analytica_df$source_id))
index_copy <- seq (1 : length (analytica_df$source_id))
cumPrelim <- matrix(nrow = length(index), ncol = length(index))

#order the analytica dataframe such that case_ann_cost is low -> high 
#cost_order <- arrange(analytica_df, case_ann_cost)

for  (j in index_copy) {
  for (i in index) {
    if (index [i] >= index_copy [j]) {
      cumPrelim [j, i] <- cost_order$scp_production[j]
    }
  }
}

cdf_full_scale <- colSums (cumPrelim, na.rm = TRUE)
supply_curve <- data.frame(cost = cost_order$scp_cost, SCP = cdf_full_scale, source = cost_order$source_type)

#Make figure
# supply_fig <- ggplot(supply_curve, aes(x = cost, y = SCP, color = source)) + 
#   geom_point(size = 2) + 
#   xlim(0, 5000) + 
   #color_scale_manual(values = c("#33a02c","#ff7f00", "#1f78b4") ) + 
#   labs( x = "Cost ($ / ton SCP)", y = "Cummulative Production (tons SCP / day)") 
# supply_fig  

#export supply curve to prism 

wwtp_prism <- filter (supply_curve, source == 'wwtp')

landfill_all <- c('landfill_flaring', 'landfill_emissions')
landfill_prism <- filter (supply_curve, source %in% landfill_all)

nat_gas_all <- c('nat_gas_flaring', 'nat_gas_emissions')
nat_gas_prism <- filter (supply_curve, source %in% nat_gas_all)

write.table(wwtp_prism, "C:/Users/sahar/Dropbox/Stanford/Research/Projects/01-inProgress/TE/figures/fig5_wwtp.txt", sep = "\t")
write.table(landfill_prism, "C:/Users/sahar/Dropbox/Stanford/Research/Projects/01-inProgress/TE/figures/fig5_landfill.txt", sep = "\t")
write.table(nat_gas_prism, "C:/Users/sahar/Dropbox/Stanford/Research/Projects/01-inProgress/TE/figures/fig5_nat_gas.txt", sep = "\t")

