X = [-10, -8, -6, -4, -2, 0, 2, 4, 6, 8, 10];
Y = [2.008, -3.668, -4.916, -1.870, -0.045, 0.550, -0.839, -1.011, 2.613, 14.615, 39.655];
p = [3, 5, 7, 9, 10];
timesGJ = [];
eGJ = [];
einfGJ = [];
timesGS = [];
eGS = [];
einfGS = [];
timesQR = [];
eQR = [];
einfQR = [];

% Aproksymacja metodą równań normalnych z wykorzystaniem własnego solwera 
% Gaussa-Jordana 
figure(1);
scatter(X, Y, 'MarkerEdgeColor', 'magenta', 'MarkerFaceColor', 'magenta', 'DisplayName', 'punkty', 'LineWidth', 1.5);
hold on    
for i=p
    display(strcat('GJ Stopień wielomianu: ', " ", int2str(i)))
    tic;
    a = approx(X, Y, i);
    t=toc;
    timesGJ = [timesGJ, t];
    x = linspace(X(1), X(end), length(X)*10);
    plot(x, polyval(flip(a), x), 'DisplayName', strcat('Wielomian ', " ", int2str(i), ' stopnia'), 'LineWidth', 2);
    eGJ = [eGJ, norm(polyval(flip(a), X)-Y)];
    einfGJ = [einfGJ, norm(polyval(flip(a), X)-Y, inf)];
end
title('Metoda równań normalnych z wykorzystaniem Gaussa-Jordana');
legend();
hold off

% Aproksymacja metodą równań normalnych z wykorzystaniem algorytmu
% Gaussa-Seidla
p = [3, 5, 7, 9];
figure(2);
scatter(X, Y, 'MarkerEdgeColor', 'magenta', 'MarkerFaceColor', 'magenta', 'DisplayName', 'punkty', 'LineWidth', 1.5);
hold on    
for i=p
    
    display(strcat('GS Stopień wielomianu: ', " ", int2str(i)))
    tic;
    a = approxGS(X, Y, i);
    t=toc;
    timesGS = [timesGS, t];
    x = linspace(X(1), X(end), length(X)*10);
    plot(x, polyval(flip(a), x), 'DisplayName', strcat('Wielomian ', " ", int2str(i), ' stopnia'), 'LineWidth', 2);
    eGS = [eGS, norm(polyval(flip(a), X)-Y)];
    einfGS = [einfGS, norm(polyval(flip(a), X)-Y, inf)];
end
title('Metoda równań normalnych z wykorzystaniem Gaussa-Seidla');
legend();
hold off

% Aproksymacja przy pomocy rozkładu QR
p = [3, 5, 7, 9, 10];
figure(3);
scatter(X, Y, 'MarkerEdgeColor', 'magenta', 'MarkerFaceColor', 'magenta', 'DisplayName', 'punkty', 'LineWidth', 1.5);
hold on    
for i=p
    display(strcat('QR Stopień wielomianu: ', " ", int2str(i)))
    tic;
    a = approxQR(X, Y, i);
    t=toc;
    timesQR = [timesQR, t];
    x = linspace(X(1), X(end), length(X)*10);
    plot(x, polyval(flip(a), x), 'DisplayName', strcat('Wielomian ', " ", int2str(i), ' stopnia'), 'LineWidth', 2);
    eQR = [eQR, norm(polyval(flip(a), X)-Y)];
    einfQR = [einfQR, norm(polyval(flip(a), X)-Y, inf)];
end
title('Metoda równań normalnych z wykorzystaniem rozkładu QR');
legend();
hold off