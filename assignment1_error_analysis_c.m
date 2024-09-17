% Part A
n = 1:10000;
% disp(n);
sum_value = sum(1./n);
disp("Answer (i)")
disp(sum_value);

% Part B
n = single(1:10000); 
rounded_vals_single = round(1./n, 5); 
sum_single = sum(rounded_vals_single);
disp("Answer (ii)")
disp('Single Precision Sum:');
disp(sum_single);  

n = 1:10000;  
rounded_vals_double = round(1./n, 5);  
sum_double = sum(rounded_vals_double);  
disp('Double Precision Sum:');
disp(sum_double); 

roundoff_err_singlep = abs(sum_single - sum_value);
disp('Round off error for single precision:');
disp(roundoff_err_singlep);

roundoff_err_doublep = abs(sum_double - sum_value);
disp('Round off error for double precision:');
disp(roundoff_err_doublep);

% Part C
n = single(1:10000);
n_reversed = flip(n);
rounded_vals_single = round(1./n_reversed, 5); 
sum_single = sum(rounded_vals_single);
disp("Answer (iii)")
disp('Single Precision Sum for Reverse Sequence:');
disp(sum_single);  

n = 1:10000;  
n_reversed = flip(n);
rounded_vals_double = round(1./n_reversed, 5);  
sum_double = sum(rounded_vals_double);  
disp('Double Precision Sum for Reverse Sequence:');
disp(sum_double); 

roundoff_err_singlep = abs(sum_single - sum_value);
disp('Round off error for single precision, Reverse Sequence:');
disp(roundoff_err_singlep);

roundoff_err_doublep = abs(sum_double - sum_value);
disp('Round off error for double precision, Reverse Sequence:');
disp(roundoff_err_doublep);