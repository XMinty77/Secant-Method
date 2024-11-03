function lambda = decaycst(A, Z, E)
    C = consts();

    % An approximation of the minimum distance between the center of a decayed child nucleus and a helium nucleus when separate
    % It is considered as the nuclear separation radius, the first classical turning point
    r1 = 1.2e-15 * ( (A - 4)^(1/3) + 4^(1/3) );

    % The second classical turning point corresponds to when the Coulomb potential is equal to the kinetic energy of the particle
    r2 = model.V(Z, 1) ./ E;

    % Velocity of the alpha particle given its kinetic energy
    velo = sqrt(2 .* E / C.m);

    % Assault frequency of the alpha particle against the barrier given its velocity and the nuclear separation radius
    freq = velo / (2 * r1);

    % The decay constant is the tunneling frequency times the tunneling probability (the average number of atoms that decay per second)
    lambda = freq .* model.T(Z, E, r1, r2);
end