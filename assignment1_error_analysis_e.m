f = @(t) exp(-t) .* (sin(2 * pi * t) + 2);
df_exact = @(t) -exp(-t) .* (sin(2 * pi * t) + 2) + (2*pi*exp(-t).*(cos(2 * pi * t)));

x0 = 1/4;
h_values = logspace(-8, -1, 100);

finite_diff_errors = zeros(size(h_values));
centered_diff_errors = zeros(size(h_values));

for i = 1:length(h_values)
    h = h_values(i);
    df_finite = (f(x0 + h) - f(x0)) / h;
    finite_diff_errors(i) = abs(df_finite - df_exact(x0));
    df_centered = (f(x0 + h) - f(x0 - h)) / (2 * h);
    centered_diff_errors(i) = abs(df_centered - df_exact(x0));
end


figure;
loglog(h_values, finite_diff_errors, 'r', 'LineWidth', 2);
hold on;
loglog(h_values, centered_diff_errors, 'b', 'LineWidth', 2);
xlabel('Step size (h)');
ylabel('Error');
title('FDA, CDA for Numerical Derivatives');
legend('Finite Difference', 'Centered Difference');
grid on;