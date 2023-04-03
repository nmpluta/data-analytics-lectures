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

  for (i in 1:N) {
    heights[i] ~ normal(mu, sigma);
  }
}

generated quantities {
  real height_sim[N];
  for (i in 1:N) {
    height_sim[i] = normal_rng(mu, sigma);
  }
}
