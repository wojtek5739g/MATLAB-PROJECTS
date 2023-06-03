function dxdt = diffEq(t, x)
    dxdt = [x(2)+x(1)*(0.3-x(1)^2-x(2)^2); -x(1)+x(2)*(0.3-x(1)^2-x(2)^2)];
end