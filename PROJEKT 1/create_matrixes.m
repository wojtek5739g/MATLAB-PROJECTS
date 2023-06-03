function [A, B] = create_matrixes(n)
    % n - wymiar macierzy
    % A, B - wyjściowe macierze opisujące układ równań
    % Funkcja tworząca macierze do zadania 1
    for i = 1:n
        B(i) = 2.5+0.4*i;
        for j = 1:n
            A(i,j) = 2*(i-j)+3;
        end
    end
    v = 1/6*ones(1, n);
    A = A - diag(diag(A))+diag(v);
    B = transpose(B);
end