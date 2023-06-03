function [t, x, deltas, H] = Heun(func, k, range, cond, hmin, ew, eb)
    % func - funkcja obliczająca wartość funkcji po prawej stronie równania
    % różniczkowego
    % k - ilość równań
    % range - zakres obliczeń
    % cond - warunki początkowe, cond(1/2) - warunek dla zmiennej x1/2
    % hmin - minimalny krok (początkowy)
    % ew - blad wzgledny
    % eb - blad bezwzgledny
    
    deltas = []; % tablica estymaty błedu
    H = [hmin]; % tablica długości kroków
    p=2;
    beta = 5; % heurystyka
    s=0.9; % współczynnik bezpieczeństwa
    x=[cond]; %wektor zmiennych x1, ..., xn
    t=[range(1)];
    h=hmin;
    n = 0; %licznik iteracji

    while 1
        %h wyznaczenie zwykla metoda Heuna potrzebne do oszacowania bledu
        f_value = func(0, x(end, :));
        f_nested_value = func(0, x(end, :)+h*f_value);

        x_next = [];
        for i=1:k
            x_next = [x_next, x(end, i) + 1/2*h*(f_value(i)+f_nested_value(i))]
        end

        h_half = h/2;

        %0.5h wyznaczenie nastepnej wartosci z podwojnym krokiem
        
        f_value = func(0, x(end, :));
        f_nested_value = func(0, x(end, :)+h_half*f_value);

        x_next_half_h = [];
        for i=1:k
            x_next_half_h = [x_next_half_h, x(end, i) + 1/2*h_half*(f_value(i)+f_nested_value(i))];
        end
        
        f_value = func(0, x_next_half_h);
        f_nested_value = func(0, x_next_half_h+h_half*f_value);
        
        x_full_half_h = [];
        for i=1:k
            x_full_half_h = [x_full_half_h, x_next_half_h(i) + 1/2*h_half*(f_value(i)+f_nested_value(i))];
        end
        
        % oszacowanie błędu
        DELTA = [];
        ERROR = [];
        for i=1:k
            DELTA = [DELTA, (x_full_half_h(i)-x_next(i))/(2^p-1)];
            ERROR = [ERROR, abs(x_full_half_h(i))*ew+eb];
        end
        deltas = [deltas; DELTA];

        % wyliczenie współczynnika korekty długości kroku
        % 0.00000001, żeby nie dzielić przez zero w ostatnim kroku
        alpha = min(ERROR./abs(DELTA))^(1/(p+1));


        h_star = s*alpha*h;

        if s*alpha>=1
            if t(end)+h==range(2)
                disp("KONIEC, OSIĄGNIETY KRANIEC PRZEDZIAŁU")
                break
            end
            ogr = beta*h;
            h=min([h_star, ogr, range(2)-t(end)]);

            t_next = t(end)+h;
            t = [t, t_next];
        else
            if h_star<hmin
                disp("Niemozliwe rozwiazanie z zadana dokladnoscia")
                break;
            else 
                h=h_star;
                t_next = t(end)+h;
                t = [t, t_next];
            end
        end
        
        H = [H, h];
        x = [x; x_full_half_h];
        n=n+1;
    end

end