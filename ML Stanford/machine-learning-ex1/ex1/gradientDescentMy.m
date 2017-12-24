%function theta= gradientDescent(X, y, theta)
function[theta, J_history] = gradientDescentMy(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
for iter = 1:num_iters
    % ====================== YOUR CODE HERE ======================
    temp0= theta(1);
    temp1= theta(2);
    for i=1:m
       temp0=temp0 + ((theta(1)*X(i,1) + theta(2)*X(i,2)) - y(i))*X(i,1);
       temp1=temp1 + ((theta(1)*X(i,1) + theta(2)*X(i,2)) - y(i))*X(i,2);
    end;
    theta(1) = theta(1) - (alpha/m)*temp0;
    theta(2) = theta(2) - (alpha/m)*temp1;
    %fprintf('%f %f \n', theta(1), theta(2));
    J_history(iter) = computeCost(X, y, theta);
end;

end
