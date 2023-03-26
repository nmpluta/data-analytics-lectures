data {
    int<lower=0> N;          // Number of trials
    int<lower=0, upper=N> y; // Probabilistic variables y
}

parameters {
    real<lower=0, upper=1> p; // Probability of allergic reaction
}

model {
  // Prior distribution for p
  p ~ normal(0.2, 0.05); 
  
  // Likelihood function
  y ~ binomial(N, p);
}

generated quantities {
  int<lower=0,upper=N> y_pred; // Predictive probability
  
  y_pred = binomial_rng(N, p); // Simulate the number of successes
}

