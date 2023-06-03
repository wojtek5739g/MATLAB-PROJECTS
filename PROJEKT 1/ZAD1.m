n = [5, 10, 25, 50, 100, 200];
times = [];
errors = [];

for i = n
    A=zeros(i);
    B=zeros(1, i);
    [A, B] = create_matrixes(i);
    
    [X, t] = solver(A, B)
    times = [times, t];
    E = norm(A*X-B);
    errors = [errors, E];
end

figure(1)
plot(n, times, 'b')
hold on
grid on
scatter(n, times, 'b', 'filled')
title('t(n)')
xlabel('Liczba równań n')
ylabel('Czas wykonania t')
hold off

figure(2)
plot(n, errors, 'r')
hold on
grid on
scatter(n, errors, 'r', 'filled')
title('ε(n)')
xlabel('Liczba równań n')
ylabel('Błąd ε')
hold off
