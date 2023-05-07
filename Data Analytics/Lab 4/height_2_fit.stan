data {
  int<lower=0> N;          // number of observations
  real weight[N];          // observed weight of each person
  real<lower=0> height[N]; // observed height of each person
}

parameters {
  real<lower=0> alpha;     // intercept
  real<lower=0> beta;      // slope
  real<lower=0> sigma;      // standard deviation
}

model {
  // priors
  alpha ~ normal(155, 10);
  beta ~ lognormal(0, 0.45);
  sigma ~ exponential(0.36);

  // likelihood
  for (i in 1:N) {
    height[i] ~ normal(alpha + beta * weight[i], sigma);
  }
}

generated quantities {
  real height_fit[N];
  for (i in 1:N) {
    height_fit[i] = normal_rng(alpha + beta * weight[i], sigma);
  }
}