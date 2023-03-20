data {
    int N; // Number of trials
}

generated quantities {
    int y; // Number of successes
    real p=normal_rng(0.2,0.05); // Probability of allergic reaction

    y = binomial_rng(N,p); // Simulate the number of successes
}

/* Without data block
generated quantities {
    int y; // Number of successes
    real p=normal_rng(0.2,0.05); // Probability of allergic reaction

    y = binomial_rng(50,p); // Simulate the number of successes
}
*/