f = @(x) sin(log(x));
x_exact = linspace(1, 3, 1000);
y_exact = f(x_exact);

n_points = [2, 3, 4, 5, 6, 7, 8, 9, 10];

for n = n_points
    x_data = linspace(1, 3, n);
    y_data = f(x_data);
    newton_interp = newton_interpolation(x_data, y_data, x_exact);
    spline_interp = spline(x_data, y_data, x_exact);
    newton_error = abs(y_exact - newton_interp);
    exact_error = abs(y_exact - f(x_exact));
    figure;
    plot(x_exact, newton_error, 'r-', 'LineWidth', 2); hold on;
    plot(x_exact, exact_error, 'b--', 'LineWidth', 2);
    xlabel('x');
    ylabel('Error');
    title(['Error Comparison (Newton vs Exact Solution, n = ', num2str(n), ')']);
    legend('Newton', 'Exact', 'Location', 'Best');
    grid on;
end

function y_interp = newton_interpolation(x_data, y_data, x_interp)
    n = length(x_data);
    coef = divided_differences(x_data, y_data);
    y_interp = coef(n);
    for i = n-1:-1:1
        y_interp = coef(i) + (x_interp - x_data(i)) .* y_interp;
    end
end

function coef = divided_differences(x_data, y_data)
    n = length(x_data);
    coef = y_data;
    for j = 2:n
        for i = n:-1:j
            coef(i) = (coef(i) - coef(i-1)) / (x_data(i) - x_data(i-j+1));
        end
    end
end