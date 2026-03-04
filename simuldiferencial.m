clear; clc; close all

R1 = 1e3;
R2 = 1e3;
R3 = 10e3;
R4 = 15e3;

C1 = 0.1e-6;
C2 = 0.1e-6;

K = 1 + R4/R3;

a2 = R1*R2*C1*C2;
a1 = R1*C1 + R2*C1 + R1*C2;
a0 = 1;

Tsim = [0 0.005];

x0 = [0; 0];

[t, x] = ode45(@diferencial, Tsim, x0);

u = ones(size(t));

figure
plot(t, u, 'k--','LineWidth',1.2)
hold on
plot(t, x(:,1), 'm','LineWidth',1.5)
hold off
grid on
xlabel('Tiempo [s]')
ylabel('Voltaje [V]')
legend('u(t) = V_{in}','y(t) = V_o')