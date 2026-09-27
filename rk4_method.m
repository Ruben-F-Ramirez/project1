function [x, y] = rk4_method(h)

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

    % RK4 method
    for i = 1:N

        xi = x(i);

        % k1
        f1 = y2;
        f2 = 3*y2 - 2*y1 + 4*xi*exp(2*xi) + 10*sin(xi);

        k1_1 = h*f1;
        k1_2 = h*f2;

        % k2
        x2 = xi + h/2;
        y1_2 = y1 + k1_1/2;
        y2_2 = y2 + k1_2/2;

        f1 = y2_2;
        f2 = 3*y2_2 - 2*y1_2 + 4*x2*exp(2*x2) + 10*sin(x2);

        k2_1 = h*f1;
        k2_2 = h*f2;

        % k3
        y1_3 = y1 + k2_1/2;
        y2_3 = y2 + k2_2/2;

        f1 = y2_3;
        f2 = 3*y2_3 - 2*y1_3 + 4*x2*exp(2*x2) + 10*sin(x2);

        k3_1 = h*f1;
        k3_2 = h*f2;

        % k4
        x4 = xi + h;
        y1_4 = y1 + k3_1;
        y2_4 = y2 + k3_2;

        f1 = y2_4;
        f2 = 3*y2_4 - 2*y1_4 + 4*x4*exp(2*x4) + 10*sin(x4);

        k4_1 = h*f1;
        k4_2 = h*f2;

        % Update
        y1 = y1 + (k1_1 + 2*k2_1 + 2*k3_1 + k4_1)/6;
        y2 = y2 + (k1_2 + 2*k2_2 + 2*k3_2 + k4_2)/6;

        x(i+1) = x4;
        y(i+1) = y1;
    end
end