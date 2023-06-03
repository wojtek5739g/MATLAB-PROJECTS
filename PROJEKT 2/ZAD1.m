range = 2:0.001:11;

figure(1)
plot(range, arrayfun(@Function, range))
hold on
Output = RangeMaker(range)
yline(0,'-');
X1 = [];
X2 = [];

%Secant method
for i=Output
    a = i{1}(1);
    b = i{1}(2);
    X = sprintf('Secant: Function(a) is %f', Function(a));  
    disp(X)
    Y = sprintf('Secant: Function(b) is %f', Function(b)); 
    disp(Y)
    [x, iter] = secant(@Function, a, b, 10^-8)
    X1 = [X1, x];
    W = sprintf('Secant: Function value of root: %d', Function(x));
    disp(W)
    Z = sprintf('Secant: Number of iterations: %d', iter);
    disp(Z)
    scatter(x, Function(x), 'r')
end
hold off

figure(2)
plot(range, arrayfun(@Function, range))
hold on
Output = RangeMaker(range);
yline(0, '-');
%Newton method
for i=Output
    a = i{1}(1);
    b = i{1}(2);
    pp = ceil((a+b)/2)
    Y = sprintf('Newton: Function(pp) is %f', Function(pp)); 
    disp(Y)
    [xf, ff, iexe, texe] = newton(@Function, (a+b)/2, 10^-8, 100);
    X2 = [X2, xf];
    xf
    W = sprintf('Secant: Function value of root: %d', Function(xf));
    disp(W)
    Z = sprintf('Newton: Number of iterations: %d', iter);
    disp(Z)
    scatter(pp, Function(pp), 'black')
    scatter(xf, Function(xf), 'r')
end
hold off

W = sprintf("Secant method roots: ");
disp(W)
disp(X1)
W = sprintf("Newton method roots: ");
disp(W)
disp(X2)

