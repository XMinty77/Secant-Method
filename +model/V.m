function result = V(Z, r)
    % The alpha decay Coulomb potential for a nucleus of atomic number Z
    result = (2 * (Z - 2) * consts().k * (consts().e ^ 2)) ./ r
end