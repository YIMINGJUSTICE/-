load ceosal2.txt
salary = ceosal2(:,1)
sales = ceosal2(:,7)
profits = ceosal2(:,8)
n = 177
X = [ones(n,1) sales profits]
K = size(X,2)
y = salary
%%%第五题%%%
histogram(sales)
histogram(profits)
histogram(salary)
betahat1 = inv(X'*X)*X'*y
uhat1 = salary-X*betahat1
R2 = 1-uhat1'*uhat1/(var(y)*(n-1))
%%%第六题%%%
nobs=10000
betasim = zeros(nobs,K)
mu = 0
sigma = 1
for i = 1:nobs
    e = mu+sigma*randn(n,1 )
    ysim = X*betahat1+e
    betasim(1,:) = inv(X'*X)*X'*y
end
[mean(betasim)' betahat1]
