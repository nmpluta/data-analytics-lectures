data {
  int<lower=0> N; // number of observations
  real weight[N]; // weight of each person
}

generated quantities {
  real alpha_pred = normal_rng(155, 10);
  real beta_pred = normal_rng(0.01, 1);
  real sigma_pred = exponential_rng(0.36);
  real height_pred[N];

  for (i in 1:N) {
    height_pred[i] = normal_rng(alpha_pred + beta_pred * weight[i], sigma_pred);
  }
}