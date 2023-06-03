function a = approxGS(X, Y, n)
    % X - wektor wartości x
    % Y - wektor wartości y
    % n - stopień wielomianu
    % a - wynikowy wektor współczynników wielomianu
    N = length(X);
    A = zeros(length(N), n+1);
    
    for i=1:N
        for k=1:n+1
            A(i, k) = X(i)^(k-1);
        end
    end
    
    [Q, R] = qr(A);
    a = R\Q'*Y'; % a = R^(-1)*Q'*Y'
end