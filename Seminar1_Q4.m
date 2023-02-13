load ceosal1.txt
salary = ceosal1(:,1)
sales = ceosal1(:,3)
roe = ceosal1(:,4)
n = 209
y = salary
histogram(salary)
histogram(sales)
histogram(roe)
%%%SLR%%%
X1 = [ones(n,1) roe]
betahat1 = inv(X1'*X1)*X1'*y
uhat1 = y-X1*betahat1
R2_1 = 1-uhat1'*uhat1/(var(y)*(n-1))
%%%MLR%%%
X2 = [ones(n,1) roe sales]
betahat2 = inv(X2'*X2)*X2'*y
uhat2 = y-X2*betahat2
R2_2 = 1-uhat2'*uhat2/(var(y)*(n-1))
