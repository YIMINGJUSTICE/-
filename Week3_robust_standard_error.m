clear all
load ceosal2.txt
salary = ceosal2(:,1);
sales = ceosal2(:,7);
profits = ceosal2(:,8);
mktval = ceosal2(:,9);
k = 3;
n = 177;  
y = salary;
X = [ones(n,1) sales profits mktval]; 
betahat = inv(X'*X)*X'*y;          % OLS estimator 
uhat = y-X*betahat;
sigma2hat = 1/(n-k-1)*uhat'*uhat;
varbetahat = sigma2hat*inv(X'*X); 
sebetahat = diag(sqrt(varbetahat)) % SE under homeskedasticity

%%%%%%%%%%%%% Robust White (1980) standard errors %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
robustvarbetahat = inv(X'*X)*(X'*diag(uhat.^2)*X)*inv(X'*X); 
robustsebetahat = sqrt(n/(n-k-1)*diag(robustvarbetahat)) % SE under heteroskedasticity
%%%%%%%%% Stata scaled standard errors by n/(n-k-1) %%%%%%%%%%%%%%%%%%%%%%

[sebetahat betahat./sebetahat robustsebetahat betahat./robustsebetahat]