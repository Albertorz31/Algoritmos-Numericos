function [sol,Error,costo] = doolittle(A, b)
[m,n] = size(A);
L = zeros(n, n);
U = zeros(n, n);
costo = 0;
for k = 1:n
    L(k, k) = 1;
	for i = k + 1: m
	L(i,k) = A(i,k) / A(k,k);
		for j = k + 1 : n
			A(i,j) = A(i,j) - L(i,k)*A(k,j);
            costo = costo+2;
        end
        costo = costo + 1;   
    end
    for j = k : n
		U(k,j) = A(k,j);
    end
end
z = inv(L)*b;
sol = inv(U)*z;
Error = norm(eye(n)-inv(L*U)*A);
costo = costo + 1;
end