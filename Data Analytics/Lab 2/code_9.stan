data {
  int<lower=1> N; // Number of ys
}

parameters {
   real y[N];   // Probabilistic variables y
   real theta;  // Probabilistic variable theta
}

model {
  // Add conditional probability density for the ys
  // given theta to the joint log probability density
  // using the incremental contribution in a loop
  for (n in 1:N)
    target += normal_lpdf(y[n] | theta, 1);

  // Add marginal probability density for theta
  // to the joint log probability density
  target += normal_lpdf(theta | 0, 1);
}