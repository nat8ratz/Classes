A = [9 1 -5; 1 -5 1; 2 -3 6];
B = [-5;-10;20];
X = [0;0;0];
es = 2;

for i = 1:1:3
    x = A(i,i);
    A(:,i) = A(:,i)/x;
    B(i) = B(i)/x;
end

for i = 1:1:3
    sum = B(i);
    sum = sum-A(i,[1:i-1 i+1:end])*X([1:i-1 i+1:end]);
    X(i) = sum;
end

iter = 1;
imax = 100;
lambda = 1.2
c=0;

while (iter<imax && c ~= 1)
    c = 1;
    for i = 1:1:3
        old = X(i);
        sum = B(i);
        sum = sum-A(i,[1:i-1 i+1:end])*X([1:i-1 i+1:end]);
        X(i) = lambda*sum + (1-lambda)*old;
        if c==1 && X(i)~=0
            ea = abs((X(i)-old)/X(i))*100;
            if ea > es
                c = 0;
            end
        end
    end
    iter = iter+1;
end
iter
X