A = [-130 70 0 0; 70 -170 100 0; 0 100 -155 55; 0 0 55 55];
[L,U,P] = lu(A)
B = [0;0;0;-2];

D = L\B
X = U\D

B2 = [-0.0981;-0.1962;-0.14715;-2.2943];

D2 = L\B2
X2 = U\D2