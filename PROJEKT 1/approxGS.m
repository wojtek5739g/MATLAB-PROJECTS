function a = approxGS(X, Y, n)
    % X - wektor wartości x
    % Y - wektor wartości y
    % n - stopień wielomianu
    % a - wynikowy wektor współczynników wielomianu
    G = zeros(n+1, n+1);
    ro = zeros(n+1, 1);
    for i=1:n+1
        for k=1:n+1
            % układ równań normalnych
            G(i, k) = sum(X.^(i-1+k-1));
        end
    end
    for k=1:n+1
        ro(k) = sum(Y.*(X.^(k-1)));
    end
  
    [a, iexe, texe]=GS(G, ro, 1e-6, 10000000*length(G));
end