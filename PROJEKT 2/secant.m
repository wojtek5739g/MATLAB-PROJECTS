function [x2, iter] = secant(f, x0, x1, eps)
    % f - funkcja, ktorej pierwiastek znajdujemy
    % x1 - początek zakresu izolacji
    % x2 - koniec zakresu izolacji
    % eps - dopuszczany błąd
    % x2 - pierwiastek o błędzie co najwyżej eps
    % iter - wykonana liczba iteracji
    i=0;
    while 1
        i=i+1;
        x2 = x1 - f(x1)*(x1-x0)/(f(x1)-f(x0));
        x0 = x1;
        x1 = x2;
        if abs(f(x2))<=eps
            break
        end
    end
    iter=i;
end