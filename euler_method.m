function [x, y] = euler_method(h)

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

    % Euler method
    for i = 1:N

        xi = x(i);
        
        % First-order system
        f1 = y2;
        f2 = 3*y2 - 2*y1 + 4*xi*exp(2*xi) + 10*sin(xi);

        % Update
        y1 = y1 + h*f1;
        y2 = y2 + h*f2;
        x(i+1) = xi + h;

        % Store y
        y(i+1) = y1;
    end
end