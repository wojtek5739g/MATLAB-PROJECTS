function q = horner(a, alpha)
    % a - współczynniki wielomianu poddawanego deflacji czynnikiem liniowym
    % alpha - aktualnie wyznaczony pierwiastek z metody
    % q - współczynniki wielomianu poddanego deflacji czynnikiem liniowym
    q = a;
    q = [q, 0];
    q(1) = 0;
    for i=2:ceil(length(q)/2)
        q(i)=a(i-1) + q(i-1)*alpha;
    end
    for i=length(q)-1:-1:ceil(length(q)/2)+1
        q(i)=(q(i+1)-a(i))/alpha;
    end
    q = q(2:end-1);
end