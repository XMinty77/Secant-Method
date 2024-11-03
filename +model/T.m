function result = T(Z, E, r1, r2)
    C = consts();

    a = -2 * sqrt(2 * C.m / C.h^2);

    result = arrayfun(@(Ev, r2v) exp(a * integral(@(x) sqrt(abs(model.V(Z, x) - Ev)), r1, r2v )), E, r2);
end