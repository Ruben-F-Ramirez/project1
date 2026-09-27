function [x, y] = modified_euler_method(h)

    % Initial conditions
    x0 = 0;
    xf = 1;
    y1 = 0;       % y(0)
    y2 = 1;       % y'(0)

    % Number of steps
    N = round((xf - x0)/h);

    % Allocate arrays
    x = zeros(1,N+1);
    y = zeros(1,N+1);

    % Initial values
    x(1) = x0;
    y(1) = y1;

    % Modified Euler method
    for i = 1:N

        xi = x(i);

        % k1
        f1 = y2;
        f2 = 3*y2 - 2*y1 + 4*xi*exp(2*xi) + 10*sin(xi);
        
        k1_1 = h*f1;
        k1_2 = h*f2;
        
        % k2
        x_next = xi + h;
        y1_temp = y1 + k1_1;
        y2_temp = y2 + k1_2;
        
        f1_temp = y2_temp;
        f2_temp = 3*y2_temp - 2*y1_temp ...
                  + 4*x_next*exp(2*x_next) ...
                  + 10*sin(x_next);

        k2_1 = h*f1_temp;
        k2_2 = h*f2_temp;

        % Update
        y1 = y1 + 0.5*(k1_1 + k2_1);
        y2 = y2 + 0.5*(k1_2 + k2_2);

        x(i+1) = x_next;
        y(i+1) = y1;
    end
end