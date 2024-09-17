f = @(x) sin(log(x));
x_exact = linspace(1, 3, 1000);
y_exact = f(x_exact);

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

function y_interp = lagrange_interpolation(x_data, y_data, x_interp)
    n = length(x_data);
    L = ones(n, length(x_interp));
    for i = 1:n
        for j = 1:n
            if j ~= i
                L(i, :) = L(i, :) .* (x_interp - x_data(j)) / (x_data(i) - x_data(j));
            end
        end
    end
    y_interp = zeros(1, length(x_interp));
    for i = 1:n
        y_interp = y_interp + y_data(i) * L(i, :);
    end
end


n_points = [2, 3, 4, 5, 6, 7, 8, 9, 10];

for n = n_points
    x_data = linspace(1, 3, n);
    y_data = f(x_data);
    poly_coef = polyfit(x_data, y_data, n-1);
    poly_interp = polyval(poly_coef, x_exact);
    newton_interp = newton_interpolation(x_data, y_data, x_exact);
    lagrange_interp = lagrange_interpolation(x_data, y_data, x_exact);
    figure;
    plot(x_exact, poly_interp, '--', 'LineWidth', 1.5); hold on;
    plot(x_exact, newton_interp, ':', 'LineWidth', 1.5);
    plot(x_exact, lagrange_interp, '-.', 'LineWidth', 1.5);
    scatter(x_data, y_data, 'r', 'filled');
    title(['Interpolation with ', num2str(n), ' Points']);
    legend('Polynomial', 'Newton', 'Lagrange', 'Location', 'Best');
    grid on;
end