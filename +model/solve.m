function energy = solve(A, Z, lambda, n)
    C = consts();

    lambda = log(lambda)
    energy = secant.apply(@(E) log(model.decaycst(A, Z, E)) - lambda, consts().e * 4e6, consts().e * 5e6, secant.stop_terms(n), [consts().e * 2e6, consts().e * 15e6]);

    energy = (energy / C.e) * 1e-6;
end