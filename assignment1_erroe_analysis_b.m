function approx = taylor_sin(x, n_terms)
    approx = 0;
    for k = 0:n_terms-1
        term = ((-1)^k * x^(2*k+1)) / factorial(2*k+1);
        approx = approx + term;
    end
end

function truncation_error = trunc_error(x, n_terms)   
    f_derivative = -sin(x);
    truncation_error = abs(f_derivative * x^(n_terms+1) / factorial(n_terms+1));
end

function roundoff_error = roundoff_error(true_val, approx_val)
    roundoff_error = abs(true_val - approx_val);
end


x = pi/4; 
true_val = sin(x);

fprintf('True value of sin(%.2f): %.8f\n', x, true_val);

n_terms = 5;
approx_val = taylor_sin(x, n_terms);
trunc_error_val = trunc_error(x, n_terms);
roundoff_error_val = roundoff_error(true_val, approx_val);
fprintf('Using %d terms:\n', n_terms);
fprintf('  Taylor Series Approximation: %.8f\n', approx_val);
fprintf('  Truncation Error: %.8f\n', trunc_error_val);
fprintf('  Round-off Error: %.8f\n\n', roundoff_error_val);