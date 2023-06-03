x0 = -4;
x1 = 0;
x2 = 4;
range=-4:0.01:4;
coef = [1, 0.9, -6, 3, -1];
X = [];

% plot(range, polyval(coef, range))
% yline(0, '-');

while (length(coef)>1)
    [x, iter] = MM1(coef, x0, x1, x2, 10^-8)
    W = sprintf('Muller: Function value of root: %d', polyval(coef, x));
    X = [X, x]
    disp(W)
    coef = horner(coef, x)
end

W = sprintf('Polynomial roots: ')
disp(W)
disp(X)