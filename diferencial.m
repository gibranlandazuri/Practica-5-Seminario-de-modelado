function dx = diferencial(t, x)
    R1 = 1e3;
    R2 = 1e3;
    R3 = 10e3;
    R4 = 15e3;
    
    C1 = 0.1e-6;
    C2 = 0.1e-6;
    
    K = 1 + R4/R3;
    
    a2 = R1*R2*C1*C2;
    a1 = C1*(R1 + R2) + R1*C2*(1 - K);
    a0 = 1;
    
    u = 1;
    
    dx = zeros(2,1);
    dx(1) = x(2);
    dx(2) = (K*u - a0*x(1) - a1*x(2)) / a2;
end