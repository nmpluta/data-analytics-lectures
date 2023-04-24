data {
    int N; // Number of samples
    int K; // Number of predictors
    array [N] real y; // measurements
    matrix [N, K] X; // design matrix
}

parameters {
    real<lower=0> sigma;
    vector[K] beta;
}

transformed parameters {
    vector [N] mu;
    mu = X*beta;
}

model {
    y ~ normal(mu, sigma);
}

generated quantities {
    vector [N] log_lik;
    array [N] real y_hat;

    for (i in 1:N) {
        log_lik[i] = normal_lpdf(y[i] | mu[i], sigma);
        y_hat[i] = normal_rng(mu[i], sigma);
    }
}