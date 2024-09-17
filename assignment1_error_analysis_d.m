e = 2.7182818;
pi = 3.141592653589793;

absolute_errors = zeros(1, 10);
relative_errors = zeros(1, 10);

for n = 1:10
    true_value = factorial(n);
    % disp("true value")
    fprintf('true value for n = %2d: %15.4f\n', ... 
        n, true_value);
    stirling_approx = sqrt(2 * pi * n) * (n / e)^n;
    % disp("stirling value")
    fprintf('stirling value for n = %2d: %15.4f\n', ... 
        n, stirling_approx);
    absolute_errors(n) = abs(true_value - stirling_approx);
    % disp("absolute error")
    fprintf('absolute error for n = %2d: %15.4f\n', ... 
        n, absolute_errors(n));
    relative_errors(n) = absolute_errors(n) / true_value;
    % disp("relative error")
    fprintf('relative error for n = %2d: %15.4f\n', ... 
        n, relative_errors(n));
end
