function [x3, iter] = MM1(p, x0, x1, x2, eps)
    % p - współczynniki wielomianu 
    % x0, x1, x2 - punkty początkowe algorytmu
    % eps - dopuszczany błąd
    % x3 - pierwiastek o błędzie co najwyżej eps
    % iter - wykonana liczba iteracji
    i=0;
    while 1
        i=i+1;
        h0 = x1-x0;
        h1 = x2-x1; 
        d0 = (polyval(p, x1)-polyval(p, x0))/h0;
        d1 = (polyval(p, x2)-polyval(p, x1))/h1;
        a = (d1-d0)/(h1+h0);
        b = a*h1+d1;
        c = polyval(p, x2);
        rad = sqrt(b*b-4*a*c);
        if abs(b+rad)>abs(b-rad)
            denom = b+rad;
        else
            denom = b-rad;
        end
        dx3 = -2*c/denom;
        x3 = x2+dx3;
        if abs(polyval(p, x3))<eps
            break
        end
        x0 = x1;
        x1 = x2;
        x2 = x3;
    end
    iter=i;
end