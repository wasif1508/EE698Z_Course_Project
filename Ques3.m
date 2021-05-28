% Code for third question
% ---------------------------
n=20;
m=40;
phi=randn(n,m);
Do=7;
w=zeros(m,1);
V=randperm(m,Do);
w(V(1:Do))=randn(Do,1);
n_var=[10^(-1), 10^(-3/4),10^(-1/2),10^(-1/4), 10^(-0)];
for c=1:5
    eps=normrnd(0,sqrt(n_var(c)),[n,1]);
    fprintf("Generated 't' for the given noise variance= %f dB: \n", 20*log10(n_var(c)));
    disp(t);
    t=phi*w+eps;
end
% ---------------------------