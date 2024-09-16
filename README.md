# ME506L_CH24S001_Assignment1

## Question 1)
### (a) assignment1_error_analysis_a.m can be used to to evaluate a function at 501 equidistance points in (0, 1) interval for both single and double precision, computing round-off error.
### (b) assignment1_erroe_analysis_b.m can be used to compute a function value with help of taylor series expansion (for given problem considered upto five terms) and estimate round off error and truncation error.
### (c) assignment1_error_analysis_c.m as part of (i) performs the 1/n summation, (ii) performed (a) on previous summation by rounding off each number upto 5 decimals, (iii) performed (a) on 1/n summation where n is reversed summation by rounding off each number upto 5 decimals
#### (c) (iv) following are the observations:
#### 1) With single precision we loses some accuracy due to round-off error, leading to a slightly smaller sum compared to the double precision result.
#### 2) Both single and double precision give nearly the same sum in reverse order
#### 3) Round-off error for single precision is lower in the reverse sequence compared to the forward sequence due to how floating-point summation works i.e., summing smaller numbers first.
