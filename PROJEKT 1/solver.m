function [X, t] = solver(A, B)
    % A, B - macierze wejściowe opisujące układ równań
    % X - wyjściowy wektor rozwiązań
    % t - czas działania algorytmu
    % Algorytm Gaussa-Jordana z częściowym wyborem elementu głównego

    tic;
    len = size(A, 1);
    
    % zmienna pomocnicza do określenia w zagnieżdżonej pętli, żeby nie
    % odejmować od wiersza, od któerego "zaczynaliśmy" w danej iteracji
    g=1;

    for k = 1:len
        % Częściowy wybór elementu głównego
        col = A(k:end, k);
        [M, I] = max(abs(col));
        I = I+k-1;
        pom = A(k, :);
        A(k, :) = A(I, :);
        A(I, :) = pom;
        pom = B(k);
        B(k) = B(I);
        B(I) = pom;
        % Dzielenie wierszy tak, by na pozycji (k, k) stała jedynka
        m = A(k, k);
        A(k, :) = A(k, :)/m;
        B(k) = B(k)/m;
        % Odejmowanie od wszystkich wierszy (oprócz od wiersza k-tego)
        % wiersza k-tego pomnożonego przez A(i, k)
        for i = 1:len
            m = A(i, k);
            if ~(i==g)
                A(i, :) = A(i, :) - m.*A(k, :);
                B(i) = B(i) - m.*B(k);
            end
        end
        g=g+1;
    end

    X = B;
    toc;
    t=toc;
end