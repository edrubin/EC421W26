# Setup ----------------------------------------------------------------------------------
  # Required packages
  library(pacman)
  p_load(fastverse, stringr, here)


# Data Download --------------------------------------------------------------------------
  # Download the life-expectancy inequality data
  le_dt =
    paste0(
      'https://opportunityinsights.org/wp-content/uploads/2018/04/',
      'health_ineq_online_table_11.csv'
    ) |>
    fread()
  # Download the county-characteristics data
  co_dt =
    paste0(
      'https://opportunityinsights.org/wp-content/uploads/2018/04/',
      'health_ineq_online_table_12.csv'
    ) |>
    fread()
  # Save raw datasets
  fwrite(
    le_dt,
    here('problem-sets', '001', 'data-raw', 'life-expectancy.csv')
  )
  fwrite(
    co_dt,
    here('problem-sets', '001', 'data-raw', 'county-characteristics.csv')
  )


# Clean data -----------------------------------------------------------------------------
  # Merge desired subsets of the two data sets
  full_dt = merge(
    le_dt[, .(
      county_code = cty,
      county_name,
      state_abb = stateabbrv,
      life_exp_q1_f = le_agg_q1_F,
      # life_exp_q2_f = le_agg_q2_F,
      # life_exp_q3_f = le_agg_q3_F,
      life_exp_q4_f = le_agg_q4_F,
      life_exp_q1_m = le_agg_q1_M,
      # life_exp_q2_m = le_agg_q2_M,
      # life_exp_q3_m = le_agg_q3_M,
      life_exp_q4_m = le_agg_q4_M,
      count_q1_f = count_q1_F,
      # count_q2_f = count_q2_F,
      # count_q3_f = count_q3_F,
      count_q4_f = count_q4_F,
      count_q1_m = count_q1_M,
      # count_q2_m = count_q2_M,
      # count_q3_m = count_q3_M,
      count_q4_m = count_q4_M
    )],
    co_dt[, .(
      county_code = cty,
      pct_smoke_q1 = cur_smoke_q1,
      # pct_smoke_q2 = cur_smoke_q2,
      # pct_smoke_q3 = cur_smoke_q3,
      pct_smoke_q4 = cur_smoke_q4,
      pct_obese_q1 = bmi_obese_q1,
      # pct_obese_q2 = bmi_obese_q2,
      # pct_obese_q3 = bmi_obese_q3,
      pct_obese_q4 = bmi_obese_q4,
      pct_exercise_q1 = exercise_any_q1,
      # pct_exercise_q2 = exercise_any_q2,
      # pct_exercise_q3 = exercise_any_q3,
      pct_exercise_q4 = exercise_any_q4,
      pct_uninsured = puninsured2010,
      poverty_rate = poor_share,
      pct_religious = rel_tot,
      pct_black = cs_frac_black,
      pct_hispanic = cs_frac_hisp,
      unemployment_rate = unemp_rate,
      median_hh_inc = hhinc00,
      is_urban = intersects_msa,
      pop = cty_pop2000,
      pop_density
    )],
    by = 'county_code',
    all = FALSE
  )
  # Combine female and male variables
  full_dt[, `:=`(
    life_exp_q1 = (life_exp_q1_f * count_q1_f + life_exp_q1_m * count_q1_m) /
      (count_q1_f + count_q1_m),
    life_exp_q4 = (life_exp_q4_f * count_q4_f + life_exp_q4_m * count_q4_m) /
      (count_q4_f + count_q4_m),
    count_q1 = count_q1_f + count_q1_m,
    count_q4 = count_q4_f + count_q4_m
  )]
  # Drop unneeded columns
  full_dt[, c(
    'life_exp_q1_f', 'life_exp_q4_f', 'life_exp_q1_m', 'life_exp_q4_m',
    'count_q1_f', 'count_q4_f', 'count_q1_m', 'count_q4_m'
  ) := NULL]
  # Melt data to long format (income quartile and gender)
  long_dt =
    pivot(
      full_dt,
      ids = which(names(full_dt) |> str_detect('q[14]', negate = TRUE)),
      how = 'longer'
    )
  # Grab income quartile and variable name
  long_dt[, `:=`(
    income_quartile = str_sub(variable, -1, -1),
    var = str_sub(variable, 1, -4)
  )]
  long_dt[, variable := NULL]
  # Pivot back to wide format
  final_dt = pivot(long_dt, values = 'value', how = 'wider', names = 'var')
  # Drop rows with missing values
  final_dt = final_dt |> na.omit()
  # Drop 'count' variable
  final_dt[, count := NULL]
  # Arrange rows by county code and income quartile
  setorder(final_dt, county_code, income_quartile)
  # Arrange columns
  setcolorder(
    final_dt,
    c('county_name', 'county_code', 'state_abb', 'income_quartile', 'life_exp')
  )

# Save cleaned dataset -------------------------------------------------------------------
  # Save
  fwrite(
    final_dt,
    here('problem-sets', '001', 'data-ps1.csv')
  )
