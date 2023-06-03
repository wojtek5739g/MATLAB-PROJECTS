function [A, B] = create_matrixes_2(n)
    % n - wymiar macierzy
    % A, B - wyjściowe macierze opisujące układ równań
    % Funkcja tworząca macierze do zadania 2
    for i = 1:n
        B(i) = -3.5+0.5*i;
    end
    for i = 3:n
        A(i, i-2) = 4.5;
    end
    for i = 1:n-2
        A(i, i+2) = 4.5;
    end
    v = -12*ones(1, n);
    A = A - diag(diag(A))+diag(v);
    B = transpose(B);
end