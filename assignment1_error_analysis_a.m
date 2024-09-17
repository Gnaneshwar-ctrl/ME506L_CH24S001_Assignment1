N = 501;
t = linspace(0, 1, N);

g = @(t) exp(-t) .* (sin(2 * pi * t) + 2);

g_double = g(t);
t_single = single(t);
g_single = g(t_single);

round_off_error = abs(g_double - g_single);

figure;
plot(t, round_off_error, 'r');
xlabel('t');
ylabel('Round-off Error');
title('Plot for evaluated round-off error');
grid on;