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

Tsim = [0 0.02];
x0 = [0; 0];

[t, x] = ode45(@(t,x) edo_sistema(t, x, K, a0, a1, a2), Tsim, x0);

u = ones(size(t));

figure
plot(t, x(:,1), 'm','LineWidth',1.5)
hold off
grid on
xlabel('Tiempo')
ylabel('Voltaje')
legend('u(t) = V_{in}','y(t) = V_o')

function dx = edo_sistema(t, x, K, a0, a1, a2)
    u = 1;
    
    dx = zeros(2,1);
    dx(1) = x(2);
    dx(2) = (K*u - a0*x(1) - a1*x(2)) / a2;
end