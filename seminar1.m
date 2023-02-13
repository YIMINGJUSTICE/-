% Creating matrices A, B and C
A = [1 2; 3 4];
B = [5, 6, 7; 8, 9, 10];
C = [A B];

% Creating the vectors 
a = [-3 8 0];
b = a'; % b = [-3; 8; 0] also works 

% Some matrix operations. 
% Are they well defined? Why?
A + B 
B*A
inv(B)

% Selecting rows and columns in a matrix
A(1:end,1)  % A(:,1)
B(2,1:end)  % B(2,:)


inv(A).*A