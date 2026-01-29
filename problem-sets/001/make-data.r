# Required packages
library(pacman)
p_load(data.table, haven, here)
# Download the experimental dataset
exp_dt = read_dta('http://www.nber.org/~rdehejia/data/nsw.dta')
setDT(exp_dt)
# Rename data ID
exp_dt[, data_id := 'NSW']
# Download the PSID control dataset
psid_dt = read_dta('http://www.nber.org/~rdehejia/data/psid_controls.dta')
setDT(psid_dt)
# Rename data ID
psid_dt[, data_id := 'PSID']
# Drop `re74` from the PSID dataset
psid_dt[, re74 := NULL]
# Combine the datasets
full_dt = rbindlist(list(exp_dt, psid_dt), use.names = TRUE, fill = TRUE)
# Reorder columns
setcolorder(
  full_dt,
  c(
    'treat', 're75', 're78', 'age', 'education', 'black', 'hispanic',
    'married', 'nodegree', 'data_id'
  )
)
# Save the dataset
fwrite(
  x = full_dt,
  file = here('problem-sets', '000', 'data-ps0.csv')
)

