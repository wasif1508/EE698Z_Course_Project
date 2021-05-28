% Code for second question
% ----Part_1-------
n=input("enter n: ");
m=input("enter m: ");
phi=randn(n,m);
fprintf("The generated dictionary matrix is: \n");
disp(phi);
% -----Part_2-------
Do=input("enter Do: ");
w=zeros(m,1);
V=randperm(m,Do);
w(V(1:Do))=randn(Do,1);
fprintf("The generated sparse weight vector 'w' is: \n");
disp(w);
% -----Part_3-------
n_var=input("enter noise variance in 'standard units': \n");
eps=normrnd(0,sqrt(n_var),[n,1]);
t=phi*w+eps;
fprintf("The generated 't' is: \n");
disp(t);
% ------------------