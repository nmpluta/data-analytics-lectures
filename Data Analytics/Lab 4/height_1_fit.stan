data {
  int<lower=0> N;           // number of observations
  real<lower=0> heights[N]; // observed heights
}

parameters {
  real<lower=100, upper=200> mu; // population mean height
  real<lower=0.001> sigma;       // population standard deviation of heights
}

model {
  mu ~ normal(170, 10);
  sigma ~ normal(15, 5);

  heights ~ normal(mu, sigma);
}

generated quantities {
  real height_fit = normal_rng(mu, sigma);
}
