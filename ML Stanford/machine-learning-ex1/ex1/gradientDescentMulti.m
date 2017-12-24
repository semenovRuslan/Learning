function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);


 for iter = 1:num_iters
    reslt=[];
    for j=1:size(theta, 1)
        temp=theta(j);
        for i=1:m
            temp= temp + ((theta'*X(i, :)') - y(i))*X(i, j);
        end;
        reslt(j)=temp;
    end;
    
    theta=theta-(alpha/m)*reslt';
    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end
