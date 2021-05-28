% Code for fourth question


% Note- Keep the functions update1 and update2 in the same folder as this
% code for proper running


% Initialising Key Variables-----
n=20;
m=40;
phi=randn(n,m);
Do=7;
w=zeros(m,1);
V=randperm(m,Do);
w(V(1:Do))=randn(Do,1);
var=10^(-0.25);% as sir mentioned we have to assume that it is given
eps=normrnd(0,sqrt(var),[n,1]);
t=phi*w+eps;
alpha=100*ones(1,m);
mu=zeros(m,1);
j=0;
% Learning the weight vector 'w'----------
while true
    mu_old=mu;
	[Sigma,mu]=update_2(var,phi,alpha,t); % Update Step
	alpha_new=update_1(mu,Sigma,alpha,m); % Update Step
    if((norm(mu-mu_old)/norm(mu_old))^2 < 10^(-3))
        fprintf("max apostertior estimate of w: \n");
        disp(mu); % max aposterior estimate of a gaussian is its mean
        break
    end
    j=j+1;
    alpha=alpha_new;
end
fprintf("Number of iterations: %d\n",j);
% ---------------------------