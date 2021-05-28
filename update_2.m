% This function updates the posterior co-variance and mean
function [Sigma_new, mu_new]=update_2(var,phi,alpha,t)
    A=diag(alpha);
	Sigma_new=inv((1/(var))*transpose(phi)*phi+A);
    mu_new=(1/(var))*((Sigma_new)*transpose(phi)*t);
end