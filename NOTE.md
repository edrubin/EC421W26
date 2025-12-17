# Miscellaneous notes

## Ideas for `R` showcase

Visualization

- guidance on [visualization](https://github.com/cxli233/FriendsDontLetFriends)
- [R graph gallery](https://r-graph-gallery.com/)
- `ggplot2` [extensions](https://exts.ggplot2.tidyverse.org/)
- `patchwork` for combining `ggplot2` plots
- interactive data visualization with `shiny`, [`plotly`](https://plotly.com/examples/), `crosstalk`, `echarts4r`, `highcharter`
- animation with `gganimate`

Extended visualization applications

- presentation with `R Markdown`, `xaringan`, `quarto`
- reporting with `R Markdown` and `bookdown`
- dashboards with `flexdashboard` or `shinydashboard`
- `reactable` for interactive tables
- `learnr` for interactive coding tutorials

Data manipulation

- data cleaning with `janitor` (also `skimr` for data exploration)
- web scraping with `rvest` and `httr`
- interacting with databases: [`dbplyr`](https://dbplyr.tidyverse.org), `DBI`, `multidplyr`, `duckdb`
- `rvest` + sports APIs (e.g., `hoopR`, `baseballr`, `worldfootballR`)
- `tidycensus` for US Census databases
- `reticulate` for integrating `Python`
- simulation/inference with `infer` and `simstudy`

Spatial and temporal data

- geospatial analysis with `sf` and `leaflet`
- also `terra`, `stars`, and `rayshader`
- `osmdata` for OpenStreetMap data
- time series analysis with `fable`, `tsibble`, `prophet`

My most-used packages

- `pacman` for package management
- `ggplot2` for data visualization
- `scales` for axis scaling in `ggplot2`
- `viridis` for colorblind-friendly color scales (`ggplot2` has some built-in options like `scale_color_viridis_d()`)
- `collapse` and `data.table` for fast data manipulation (alternative to `dplyr` in the `tidyverse`)
- `future.apply` for parallel processing
- `lubridate` for date-time manipulation
- `stringr` for string manipulation
- `fst` and `qs` for fast/efficient data storage
- `haven` for reading/writing SPSS, Stata, and SAS files
- `fixest` for fast fixed effects regression
