parameters {
  real<lower=100, upper=200> mu; // population mean height
  real<lower=0.001> sigma;       // population standard deviation of heights
}

model {
  mu ~ normal(170, 10);
  sigma ~ normal(15, 5);
}

generated quantities {
  real mu_pred = normal_rng(170, 10);
  real sigma_pred = normal_rng(15, 5);
  real height_pred = normal_rng(mu_pred, sigma_pred);
}