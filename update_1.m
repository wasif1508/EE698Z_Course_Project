% This function is used to update the hyperparameter 'alpha'
function [alpha_new]= update_1(mu,Sigma,alpha,m)
    alpha_new=zeros(1,m);
	for i=1:m
		alpha_new(i)=(1-(alpha(i)*Sigma(i,i)))/((mu(i))^2);
    end
end