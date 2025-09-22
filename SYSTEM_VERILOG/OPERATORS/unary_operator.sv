//unary reduction operators- operation performs on only one operand
/***************USE CASE********************
- These operations can be useful in parity checker, vector has odd/even ones etc;
- &, ~&, |, ~|, ^, ~^
- b=^a --> b=0 if 'a' has even number of 1's else b=1(odd number of 1's).
- b=&a --> b=0 if 'a' has atleast one zero. And b=1, if 'a' has all 1's.
- b=|a --> b=0 if a has all zeros. And b=1 if 'a' has atleast one '1'.