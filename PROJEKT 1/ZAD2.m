n = [5, 10, 25, 50, 100, 200];
times = [];
timesGS = [];
errors = [];
errorsGS = [];

for i = n
    A=zeros(i);
    B=zeros(1, i);
    [A, B] = create_matrixes_2(i);
    
    [X, t] = solver(A, B);
    times = [times, t];
    E = norm(A*X-B);
    errors = [errors, E];
    [xf, iexe, texe] = GS(A, B, 1e-6, 1000*i);
    e = norm(A*xf-B);
    errorsGS = [errorsGS, e];
    timesGS = [timesGS, texe];
end

figure(1)
plot(n, times, 'b')
hold on
grid on
scatter(n, times, 'b', 'filled')
title('t(n) Gauss-Jordan')
xlabel('Liczba równań n')
ylabel('Czas wykonania t')
hold off

figure(2)
plot(n, errors, 'r')
hold on
grid on
scatter(n, errors, 'r', 'filled')
title('ε(n) Gauss-Jordan')
xlabel('Liczba równań n')
ylabel('Błąd ε')
hold off

figure(3)
plot(n, timesGS, 'b')
hold on
grid on
scatter(n, timesGS, 'b', 'filled')
title('t(n) Gauss-Seidel')
xlabel('Liczba równań n')
ylabel('Czas wykonania t')
hold off

figure(4)
plot(n, errorsGS, 'r')
hold on
grid on
scatter(n, errorsGS, 'r', 'filled')
title('ε(n) Gauss-Seidel')
xlabel('Liczba równań n')
ylabel('Błąd ε')
hold off
