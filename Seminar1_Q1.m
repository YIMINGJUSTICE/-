% Wage and education example 
% Read in the data 
clear all;
wage=[ 3.1; 3.2; 3; 6; 5.3; 8.8; 11; 5; 3.6; 18; 6.3; 8.1];
educ=[11; 12; 11; 8; 12; 16; 18; 12; 12; 17; 16; 13];
cnst=ones(12,1);% Defines a constant term 

% Regress wage on constant and education  
% Using fitlm function: produces object with OLS output  
Y=wage;X=educ;
% Object name: estwage, automatically includes a constant  
estwage=fitlm(X,Y) 
% Save coefficients 
b_hat=estwage.Coefficients{:,1};%use curly brackets to extract from table 
% Construct residuals: check same as residual in object output
res=Y-[cnst X]*b_hat;
% Residual sum of squares: same as SSE in object
rss=res'*res;
%  and so on .....

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Alternative ways of computing OLS Estimates in MATLAB %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Xcnst=[cnst X];
betahat_1=((Xcnst'*Xcnst)^(-1))*(Xcnst'*Y);%OLS formula 
betahat_2=inv(Xcnst'*Xcnst)*Xcnst'*Y;%OLS formula
betahat_3=Xcnst\Y;

regress(wage,[cnst educ])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Alternative Specifications %%%%%%%%%%%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Linear relationship: Level on Level %%%%%%%%

%%% increase one year of eduction increases wage 1.04 pound per hour 
%%% But is this a sensible functional form? Assumes 
%%% increase either first year of education or twentieth is 1.04 - may not be reasonable


%%%% Log on Level %%%%%

%%%% Possibly better characterisation of how wages change with eduation is 
%%% each year of education increases wages by a constant percentage
%%% Therefore regeress log(wage) on education
lY=log(Y);
estwage_log_log=fitlm(X,lY)
%%% But we need to multiply estimated coefficient on education by 100 to
%%% get the effect of a one year change in education on the percentage change in wages 
%% So here 0.1352*100=13.52% increase in the wage for every additional year of education 
%% referred to as the semi-elasticity



%%%% Log on Log %%%%%%%%

%%% Most common functional form in Finance/Economics, convenient to specify form which estiamtes a contant 
%%% elasticity such that te coeffcient is % change in X and % chnage in Y 




% Dummy Male/Female
X1=[1 0 0 1 1 0 1 0 1 0 0  1]';
X2=1-X1;
Y=wage;
X=[cnst educ X1];


