data {
  int<lower=1> N; // Number of ys
}

parameters {
   real y[N];   // Probabilistic variables y
   real theta;  // Probabilistic variable theta
}

model {
  // conditional probability denisty for the ys
  // given theta
  y ~ normal(theta, 1);
  // prior probability density for theta
  theta ~ normal(0, 1);
}