function [x, y] = exact_method(h)

    % Initial and final values
    x0 = 0;
    xf = 1;

    % Number of steps
    N = round((xf - x0)/h);

    % Create x values
    x = zeros(1,N+1);

    % Create y array
    y = zeros(1,N+1);

    % Calculate x values
    for i = 1:N+1
        x(i) = x0 + (i-1)*h;
    end

    % Exact solution
    y = (2*x.^2 - 4*x + 7).*exp(2*x) ...
        - 10*exp(x) + sin(x) + 3*cos(x);

end