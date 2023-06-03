n=[5, 10, 25, 50, 100, 200]
n = [5]

for i = n
    A=zeros(i);
    B=zeros(1, i);
    [A, B] = create_matrixes(i);

    X=solve2(A, B);
    E = norm(A*X-B);
    rozw=linsolve(A, B);
end

% A
% B
% col = A(:, 1);
% [M, I] = max(abs(col));
% pom = A(1, :);
% A(1, :) = A(I, :);
% A(I, :) = pom;
% pom = B(1);
% B(1) = B(I);
% B(I) = pom;
% A
% B

%rozw = linsolve(A, B)

%[M, I] = min(rozw)

% x=diag(ones(1, 5))

%y = CalcArea(2, 3)

%function area = CalcArea(a, b)
%    area = 2*a*b
%end