#set page(
  paper: "us-letter",
  margin: (
    top: 1.0in, bottom: 1.0in,
    left: 1.0in, right: 1.0in
  ),
  numbering: "1",
  number-align: center + bottom,
)

#set text(size: 10.5pt, font: "Charter")
#set par(justify: false, leading: 0.55em)

#let section(body) = [
  #v(0.45em)
  #text(14pt, weight: "bold")[#body]
  #linebreak()
]

#let q(num, points, body) = [
  #v(0.35em)
  #strong[#num. (#points points)#h(0.2em)] #body
  #v(0.75em)
]

// Determine whether to show answers
#let showanswers = false
// #let showanswers = true
// Function to format T/F answers
#let atf(body) = [
  #if showanswers [
    #text(weight: "bold", fill: orange)[#body]
  ] else [
    #body
  ]
]
// Function to format short-answer answers
#let asa(body) = [
  #if showanswers [
    #text(style: "italic", fill: orange)[#body]
  ] else [
    #hide[#body]
  ]
]

#let ans(height) = v(height)

#text(12pt, weight: "semibold")[Name: ]

#v(0.45cm)

#align(center)[
  #text(16pt, weight: "bold")[In-class final, EC421, Winter 2026]
  #linebreak()
  #text(12.0pt)[180 points possible]
]

#v(0.35cm)

#section[Section 1: True or false (105 points; 35 questions)]
#linebreak()
#v(-1.5em)
*Note:* Select the correct answer (true or false). Do not explain your answer.

#q(1, 3, [[ #atf([T]) / F ]#h(0.2em) The fundamental problem of causal inference is that we cannot observe both potential outcomes for the same individual at the same moment in time.]) 

#q(2, 3, [[ #atf([T]) / F ]#h(0.2em) If $E[u_i|X] != 0$, OLS-based coefficient estimates should not be interpreted as causal effects.])

#q(3, 3, [[ T / #atf([F]) ]#h(0.2em) Heteroskedasticity changes whether OLS is unbiased for estimating the coefficients.])

#q(4, 3, [[ T / #atf([F]) ]#h(0.2em) If disturbances are autocorrelated, we only need to worry about standard errors and not about the coefficients.])

#q(5, 3, [[ #atf([T])  / F ]#h(0.2em) _In the context of time-series models:_ Strict exogeneity is a stronger assumption than contemporaneous exogeneity.])

#q(6, 3, [[ #atf([T]) / F ]#h(0.2em) Cluster-robust standard errors can be useful when disturbances correlate across individuals within an area.])

#q(7, 3, [[ T / #atf([F]) ]#h(0.2em) A consistent estimator is unbiased in finite samples.])

#q(8, 3, [[ #atf([T]) / F ]#h(0.2em) Classical measurement error in an explanatory variable tends to bias OLS coefficients toward zero.])

#q(9, 3, [[ #atf([T]) / F ]#h(0.2em) In a time-series model with a lagged _outcome variable_, OLS can still be consistent under contemporaneous exogeneity.])

#q(10, 3, [[ T / #atf([F]) ]#h(0.2em) If the disturbance is autocorrelated in a static time-series regression, OLS is biased for the coefficients.])

#q(11, 3, [[ T / #atf([F]) ]#h(0.2em) A random walk s non-stationary because its mean grows over time.])

#q(12, 3, [[ #atf([T]) / F ]#h(0.2em) While a random walk its non-stationary, the first difference of a random walk $(x_(t)-x_(t-1))$ _is_ stationary.])

#q(13, 3, [[ #atf([T]) / F ]#h(0.2em) In the Rubin causal model, $Y_(0i)$ refers to the outcome for individual $i$ _without treatment_.])

#q(14, 3, [[ #atf([T]) / F ]#h(0.2em) _Selection into treatment_ means that the treatment variable is correlated with the disturbance.])

#q(15, 3, [[ T / #atf([F]) ]#h(0.2em) A valid instrument must be either relevant or exogenous.])

#q(16, 3, [[ #atf([T]) / F ]#h(0.2em) In 2SLS, the first stage regresses the endogenous regressor on the instrument (or instruments) and any additional controls.])

#q(17, 3, [[ T / #atf([F]) ]#h(0.2em) If the instrument is slightly correlated with the disturbance, the IV estimator is still consistent---as long as the instrument is strongly relevant.])

#q(18, 3, [[ #atf([T]) / F ]#h(0.2em) Adding an irrelevant regressor will increase $R^2$.])

#q(19, 3, [[ T / #atf([F]) ]#h(0.2em) In cross-sectional data, correlated disturbances across observations can cause OLS to be biased when estimating the regression coefficients.])

#q(20, 3, [[ T / #atf([F]) ]#h(0.2em) A $p$-value of $0.98$ provides strong evidence against the null hypothesis.])

#q(21, 3, [[ T / #atf([F]) ]#h(0.2em) In a log-linear model, the slope coefficient provides an elasticity.])

#q(22, 3, [[ #atf([T]) / F ]#h(0.2em) _In panel data:_ Unit fixed effects absorb time-invariant differences across individuals.])

#q(23, 3, [[ #atf([T]) / F ]#h(0.2em) _In panel data:_ Year fixed effects absorb shocks that are common to all units in a given year.])

#q(24, 3, [[ #atf([T]) / F ]#h(0.2em) An interation term allows the effect of one regressor to depend on the level of another regressor.])

#q(25, 3, [[ T / #atf([F]) ]#h(0.2em) Suppose $x_i$ and $w_i$ both affect $y_i$ _and_ $"Cov"(x_i, w_i) = 0$. #linebreak() _True or false:_ Regressing $y_i$ on $x_i$ will produced biased estimates because we omitted $w_i$.])

#q(26, 3, [[ T / #atf([F]) ]#h(0.2em) A funnel-shaped plot of residuals against fitted values is consistent with homoskedasticity.])

#q(27, 3, [[ T / #atf([F]) ]#h(0.2em) The Goldfeld-Quandt test is designed to detect autocorrelation.])

#q(28, 3, [[ #atf([T]) / F ]#h(0.2em) Newey-West standard errors are designed for time-series settings with autocorrelation.])

#q(29, 3, [[ #atf([T]) / F ]#h(0.2em) Random assignment helps make treatment independent of omitted determinants of the outcome.])

#q(30, 3, [[ T / #atf([F]) ]#h(0.2em) In the model $"Wage"_i = beta_0 + beta_1 "Grad"_i + u_i$ (where $"Grad"_i$ is a binary variable indicating whether individual $i$ is a college graduate), the parameter $beta_1$ represents the average earnings for college graduates.])

#q(31, 3, [[ T / #atf([F]) ]#h(0.2em) In the model $"Wage"_i = beta_0 + beta_1 "Age"_i + beta_2 "Age"_i^2 + u_i$, the effect of an additional year of age is constant.])

#q(32, 3, [[ T / #atf([F]) ]#h(0.2em) If a variable's variance changes over time, but its mean _does not_ change with time, then the variable is stationary.])

#q(33, 3, [[ #atf([T]) / F ]#h(0.2em) _Exogeneity_ of an instrumental variable requires that the instrument does not directly affect the outcome variable.])

#q(34, 3, [[ T / #atf([F]) ]#h(0.2em) If two groups' disturbances have the same mean but different variances, then the model is homoskedastic.])

#q(35, 3, [[ #atf([T]) / F ]#h(0.2em) _Relevance_ of an instrumental variable requires that the instrument correlates with the endogenous regressor.])

#pagebreak()

#section[Section 2: Short answer (75 points; 10 questions)]

*Note:* _In this section_, briefly answer the questions/prompts in 1--3 short (and complete) sentences.

#q(36, 20, [
  You observe annual data for a sample of individuals throughout the US in 2025. You estimate the following model:
$
  "Employed"_(i) = beta_0 + beta_1 ("Minimum Wage")_(i) + u_(i)
$
where $"Employed"_i$ is a binary variable indicating whether individual $i$ is employed, and $"Minimum Wage"_i$ is the minimum wage (in dollars) in the state where individual $i$ lives.

  #strong[(a) (5 points)] Suppose you estimate $hat(beta)_(1)=-0.05$. Interpret this estimate in words. 

  #asa([This estimate suggests that a one-dollar increase in the minimum wage is associated with a 5-percentage-point decrease in the probability of being employed, holding all else constant.]) #v(1.5cm)

  #strong[(b) (5 points)] Why might we be concerned about omitted-variable bias in this estimate for $beta_1$? Provide one potential source of such bias and briefly explain your answer.

  #asa([If states with higher minimum wages also have stronger labor markets, then the estimated effect of the minimum wage on employment may be confounded by these unobserved factors.]) #v(1.5cm)

  #strong[(c) (5 points)] Suppose you find out that the minimum wage variable in your dataset is measured with error. Explain how this measurement error could affect your estimate of $beta_1$.

  #asa([_Classical_ measurement error in the minimum wage variable would likely bias the estimate of $beta_1$ toward zero, making it appear that the minimum wage has a smaller effect on employment than it actually does.]) #v(1.5cm)

  #strong[(d) (5 points)] Would it would be appropriate to cluster standard errors at the state? Explain your answer.

  #asa([Clustering standard errors at the state level would be appropriate because individuals within the same state may experience similar economic conditions and policies, leading to correlated disturbances. Clustering would help account for this intra-state correlation and provide more accurate standard error estimates.])

])

#pagebreak()

#q(37, 15, [
  Suppose you want to estimate the causal effect of education on earnings, _i.e._,
You have cross-sectional data on earnings, years of education, and the distance from each person's childhood home to the nearest four-year college.

  #strong[(a) (3 points)] Write down an econometric model for the effect of education on earnings.

  #asa([One candidate model to estimate the effect of education on earnings is:
    $
      "Earnings"_i = beta_0 + beta_1 "Education"_i + u_i
    $]) #v(0.9cm)

  #strong[(b) (2 points)] Which OLS assumption(s) are required for OLS to be unbiased for estimating the effect of education on earnings?

  #asa([The key OLS assumption required for unbiased estimation is exogeneity: the disturbance $u_i$ is uncorrelated with the education variable, i.e., $E[u_i|"Education"_i] = 0$. We also need variation in the education variable, i.e., $"Var"("Education"_i)!=0$.]) #v(1.35cm)

  #strong[(c) (5 points)] Does _distance to the nearest four-year college_ satisfy the relevance and exogeneity conditions for a valid instrument for education? Discuss each condition separately.

  #asa([Distance to the nearest four-year college may satisfy the relevance condition: individuals who live closer to four-year colleges may, on average, receive higher levels of education. The exogeneity condition is trickier: if distance to college is correlated with unobserved factors that also affect earnings, such as family background or local labor market conditions, we would violate exogeneity. Therefore, while distance may be a relevant instrument, its exogeneity is questionable.]) #v(1.5cm)

  #strong[(d) (5 points)] Suppose you receive additional data on individuals' demographics. Update your econometric model from *(a)* to include (1) an indicator for whether the individual is female _and_ (2) an interaction between this new indicator and education. Briefly explain how to interpret the coefficient on the interaction term.

  #asa([The updated econometric model would be:
    $
      "Earnings"_i = beta_0 + beta_1 "Education"_i + beta_2 "Female"_i + beta_3 ("Education"_i times "Female"_i) + u_i
    $
  The coefficient on the interaction term, $beta_3$, estimates how the effect of education on earnings differs beteween females and non-females.
  ])

])

#pagebreak()

#q(38, 5, [Define the concept of a standard error.])

#asa([A standard error is the standard deviation of the sampling distribution of an estimator. Thus, it provides a measure of how much and estimator's estimates will vary from sample to sample. _In other words:_ Standard errors provide a measure of the variability or uncertainty associated with estimators.])
#v(2.8cm)

#q(39, 5, [Define and explain the concept of exogeneity in a cross-sectional regression. Then explain why exogeneity is important for OLS.])

#asa([Exogeneity in a cross-sectional regression means that the disturbance term is uncorrelated with the explanatory variables, i.e., $E[u_i|X] = 0$. This requirement implies that there are no omitted variables that are correlated with both the explanatory variables and the outcome variable. Exogeneity is crucial for OLS because if it is violated, OLS estimates will be biased and cannot be interpreted as causal effects.])
#v(2.8cm)

#q(40, 5, [Suppose GDP and $"CO"_2$ emissions are each upward-trending variables. Why might a regression of GDP on $"CO"_2$ emissions produce misleadingly strong results even if the variables are unrelated?])

#asa([If both GDP and $"CO"_2$ emissions are upward-trending over time, they are non-stationary (likely mean- and/or variance-non-stationary). A regression of two such variables may show a strong positive relationship simply because of their common trend, even if there is no causal relationship between them: a spurious correlation. We essentialy have an omitted-variable issue, where the omitted variable is time.])

#pagebreak()

#q(41, 5, [Consider the model
$
  "Health"_t = beta_0 + beta_1 "Exercise"_t + beta_2 "Exercise"_(t-1) + beta_3 "Exercise"_(t-2) + u_t.
$
What is the total effect of a one-unit increase in exercise? Briefly explain your answer.])

#asa([The total effect of a one-unit increase in exercise is the sum of the coefficients on the current and lagged exercise variables: $beta_1 + beta_2 + beta_3$. Each coefficient captures the effect of exercise at a different time period, so we need to sum them to get the total effect over time.])
#v(2.3cm)

#q(42, 5, [Explain why taking the difference between the mean of the dependent variable for the treated group and the mean of the dependent variable for the control group does not necessarily give us an unbiased estimate of the average treatment effect.])

#asa([Taking the difference in means between the treated and control groups does not necessarily give us an unbiased estimate of the average treatment effect because of potential selection into treatment. If the treated and control groups differ systematically in ways that also affect the outcome variable, then the difference in means may reflect these underlying differences rather than the causal effect of the treatment.])
#v(2.3cm)

#q(43, 5, [If disturbances are heteroskedastic, what problem does this create for the usual OLS confidence intervals and hypothesis tests? What is one common fix?])

#asa([If disturbances are heteroskedastic, the usual OLS standard errors will be biased, which in turn leads to invalid confidence intervals and hypothesis tests. One common fix is to use heteroskedasticity-robust standard errors, which adjust for the presence of heteroskedasticity and provide valid inference even when the variance of the disturbances is not constant.])

#pagebreak()

#q(44, 5, [Suppose you are studying monthly sales and advertising for one firm over several years. Write down a time-series model that you could use to estimate the effect of advertising on sales. Your model *should not* be static. Then explain how autocorrelation in the disturbance could affect OLS estimates in your model.])

#asa([One candidate econometric model is:
$
  "Sales"_t = beta_0 + beta_1 "Advertising"_t + beta_2 "Advertising"_(t-1) + u_t
$
In this model, autocorrelation in the disturbance term $u_t$ means that the error in one period is correlated with the error in another period. This correlation violates the OLS assumption of uncorrelated disturbances, which can lead to biased standard errors and invalid inference.]) 
#v(2.9cm)

#q(45, 5, [In words, explain what unit-level fixed effects are _and_ how they help us control for omitted-variable bias in panel data.])

#asa([Unit-level fixed effects are effectively separate intercepts for each unit in the dataset. By including these fixed effects in the regression, we control for time-invariant differences between the units that could otherwise generate omitted-variable bias.])

