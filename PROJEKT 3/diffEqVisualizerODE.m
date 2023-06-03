tic;
[tODE, xODE] = ode45(@diffEq, [0, 20], [8; -7]);
timerode45=toc
tic;
[t, x, deltas, H] = Heun(@diffEq, 2, [0, 20], [8, -7], 0.0001, 1e-4, 1e-8);
timerHeun=toc

figure(1)
plot(tODE, xODE(:, 1), '-o', 'DisplayName', 'ode45')
title('Trajektoria x_1(t)')
hold on
plot(t, x(:, 1), '-o', 'DisplayName', 'Heun')
hold off
xlabel('t')
ylabel('x_1')
set(get(gca,'ylabel'),'rotation', 0)
legend show

figure(2)
plot(tODE, xODE(:, 2), '-o', 'DisplayName', 'ode45')
title('Trajektoria x_2(t)')
hold on
plot(t, x(:, 2), '-o', 'DisplayName', 'Heun')
hold off
xlabel('t')
ylabel('x_2')
set(get(gca,'ylabel'),'rotation', 0)
legend show

figure(3)
plot(xODE(:, 1), xODE(:, 2), '-o', 'DisplayName', 'ode45')
title('Trajektoria x_2(x_1)')
hold on
plot(x(:, 1), x(:, 2), '-o', 'DisplayName', 'Heun')
hold off
xlabel('x_1')
ylabel('x_2')
set(get(gca,'ylabel'),'rotation', 0)
legend show

deltas(end, :) = [];

figure(4)
plot(t(1:end-1), deltas(:, 1), 'DisplayName', '\delta_x_1 (t)')
title('Zależność estymaty błędu od czasu')
hold on
plot(t(1:end-1), deltas(:, 2), 'DisplayName', '\delta_x_2 (t)')
hold off
xlabel('t')
ylabel('\delta')
legend show

figure(5)
plot(t, H, 'DisplayName', 'h(t)')
title('Zależność długości kroku od czasu')
xlabel('t')
ylabel('h')
legend show


