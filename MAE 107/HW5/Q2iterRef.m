A = [5 4 7 2; -3 1 6 4; 1 3 4 5; 0.5 2 8 7];
B = [1;2;3;4];

[L,U] = lu(A);

D = L\B;
X = U\D;

X = round(X,4)

Bnew = A*X;

dB = Bnew - B;

D = L\dB;
dX = U\D

Xf = X+dX;

fprintf('Xf = \n')
fprintf('%.8f\n', Xf)