global a_1 a_2 a_3 b_1 b_2 b_3 c_1 c_2 c_3

% Germany
a_1 = 0.0142;
a_2 = 0.3367;
a_3 = -0.0495;
b_1 = -0.01449;
b_2 = -0.5948;
b_3 = 0.0263;
c_1 = 0.0014;
c_2 = 0.0698;
c_3 = 0.1517;
tspan = [0 100];


syms x y z
equations = [a_1*x*(1-x)+a_2*x*z/(1+z)+a_3*x*y == 0,...
    b_1*y*(1-y)+b_2*y*z/(1+z)+b_3*x*y == 0, ...
    c_1*z*(1-z)+c_2*x*z/(1+x)+c_3*z*y/(1+y) == 0];
solutions = solve(equations, [x y z]);

for i = 1:length(solutions.x)
    % equilibrium point 
    x0 = [double(solutions.x(i)), double(solutions.y(i)), double(solutions.z(i))];
    [x,fval,exitflag,output,jacobian] = fsolve(@equation, x0);

    % Stability analysis
    eig(jacobian)

    % Runge-Kutta
    [t,y] = ode45(@model, tspan, x0);

    % Plot making
    make_phase_plot(y, x0, 'phase plot for ode45')
end
