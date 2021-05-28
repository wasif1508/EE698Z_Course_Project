% Code for fifth question


% Note- Keep the functions update1 and update2 in the same folder as this
% code for proper running


% Initialising Key Variables -----------------------------
n=20;
m=40;
Do=7;
var=[10^(-1),10^(-0.75),10^(-0.5),10^(-0.25),10^(-0)];% as sir mentioned we are assuming it is given
w_fin=[];
phi=randn(n,m);
w=zeros(m,1);
V=randperm(m,Do);
w(V(1:Do))=randn(Do,1);
nmse=[];
% Learning the Weight Vector 'w' for each of the given noise variance--------
for i=1:size(var,2)
    j=0;
    tep=0;
    for u=1:500 % Calculating NMSE error for each of the given noise variance 500 times 
        alpha=100*ones(1,m);
        eps=normrnd(0,sqrt(var(i)),[n,1]);
        t=phi*w+eps;
        mu=zeros(m,1);
        % Learning procedure starts -----
        while true
            mu_old=mu;
            [Sigma,mu]=update_2(var(i),phi,alpha,t); % Update Step
            alpha_new=update_1(mu,Sigma,alpha,m); % Update Step
            if((norm(mu-mu_old)/norm(mu_old))^2 < 10^(-3))
                w_fin=[w_fin,mu]; % max aposterior estimate of a gaussian is its mean
                break
            end
            j=j+1;
            alpha=alpha_new;
        end
        % End of Learning Procedure ------
        tep=tep+((norm(mu-w)/norm(w))^2); %Summing the obtained value of NMSE error for that particular iteration
    end
    nmse=[nmse,(tep/500)]; % Storing the average NMSE error for that particular noise variance.
    fprintf("%d. Average Number of iterations for noise variance= %.1f dB: %.1f\n",i,20*log10(var(i)),(j/500));
end
var=20*log10(var); % Conversion to dB scale
% Making Plots ------------------
semilogy(var,nmse);
xlabel('variance in dB scale');
ylabel('Average NMSE values');
% -------------------------------