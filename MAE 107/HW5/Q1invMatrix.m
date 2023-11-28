A = [5 4 7 2; -3 1 6 4; 1 3 4 5; 0.5 2 8 7];
Ainv = zeros(4,4);
I = eye(4,4);

[L,U] = lu(A);

for n=1:1:4
    D = L\I(:,n);
    Ainv(:,n) = U\D;
end

Ainv

A*Ainv