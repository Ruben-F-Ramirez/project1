
clear
clc
close all

% exact solution
f = @(x,Y) [Y(2); ...
    3*Y(2) - 2*Y(1) + 4*x*exp(2*x) + 10*sin(x)];

% Initial conditions
Y0 = [0; 1];

% Interval
xspan = [0 1];

% Exact/reference solution using ode45
[x_exact,Y_exact] = ode45(f, xspan, Y0);

% ============================================================
% h = 0.2
% ============================================================

h = 0.2;

[x1,y1] = euler_method(h);
[x2,y2] = modified_euler_method(h);
[x3,y3] = rk4_method(h);

fig1 = figure;

plot(x_exact,Y_exact(:,1),'k-','LineWidth',2)
hold on
plot(x1,y1,'o-','LineWidth',1.5)
plot(x2,y2,'s-','LineWidth',1.5)
plot(x3,y3,'^-','LineWidth',1.5)

xlabel('x')
ylabel('y(x)')
title('Numerical Solutions for h = 0.2')
legend('Exact (ode45)','Euler','Modified Euler','RK4', ...
    'Location','best')
grid on
hold off
exportgraphics(fig1,'figures/solution_h_0_2.pdf','ContentType','vector');
% ============================================================
% h = 0.1
% ============================================================

h = 0.1;

[x4,y4] = euler_method(h);
[x5,y5] = modified_euler_method(h);
[x6,y6] = rk4_method(h);

fig2 = figure;

plot(x_exact,Y_exact(:,1),'k-','LineWidth',2)
hold on
plot(x4,y4,'o-','LineWidth',1.5)
plot(x5,y5,'s-','LineWidth',1.5)
plot(x6,y6,'^-','LineWidth',1.5)

xlabel('x')
ylabel('y(x)')
title('Numerical Solutions for h = 0.1')
legend('Exact (ode45)','Euler','Modified Euler','RK4', ...
    'Location','best')
grid on
hold off
exportgraphics(fig2,'figures/solution_h_0_1.pdf','ContentType','vector');
% ============================================================
% h = 0.05
% ============================================================

h = 0.05;

[x7,y7] = euler_method(h);
[x8,y8] = modified_euler_method(h);
[x9,y9] = rk4_method(h);

fig3 = figure;

plot(x_exact,Y_exact(:,1),'k-','LineWidth',2)
hold on
plot(x7,y7,'o-','LineWidth',1.5)
plot(x8,y8,'s-','LineWidth',1.5)
plot(x9,y9,'^-','LineWidth',1.5)

xlabel('x')
ylabel('y(x)')
title('Numerical Solutions for h = 0.05')
legend('Exact (ode45)','Euler','Modified Euler','RK4', ...
    'Location','best')
grid on
hold off
exportgraphics(fig3,'figures/solution_h_0_05.pdf','ContentType','vector');
