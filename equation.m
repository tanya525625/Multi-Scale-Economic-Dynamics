function dydt = equation(u)
    global a_1 a_2 a_3;
    global b_1 b_2 b_3;
    global c_1 c_2 c_3;
    global up;
    dydt = [a_1*u(1)*(1-u(1)) + a_2*u(1)*u(3)/(1+u(3)) + a_3*u(1)*u(2) + up(1);
        b_1*u(2)*(1-u(2)) + b_2*u(2)*u(3)/(1+u(3)) + b_3*u(1)*u(2) + up(2); 
        c_1*u(3)*(1-u(3)) + c_2*u(3)*u(1)*(1+u(1)) + c_3*u(3)*u(2)/(1+u(2)) + up(3)];
end