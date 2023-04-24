data {
    int N; // Number of samples
    array [N] real y; // measurements
}

parameters {
    real<lower=0> sigma;
    real mu;
}

model {
    target += 2*log(sigma);
    target += normal_lpdf(y|mu, sigma);
}

generated quantities {
    vector [N] log_lik;
    array [N] real y_hat;

    for (i in 1:N) {
        log_lik[i] = normal_lpdf(y[i] | mu, sigma);
        y_hat[i] = normal_rng(mu, sigma);
     }
}