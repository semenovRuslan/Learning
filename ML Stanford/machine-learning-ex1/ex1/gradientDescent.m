%function theta= gradientDescent(X, y, theta)
function[theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
for iter = 1:num_iters
    % ====================== YOUR CODE HERE ======================
    
    hypothesis=X*theta;
    differ=hypothesis-y;
    theta(1)=theta(1) - alpha/m*differ'*X(:,1);
    theta(2)=theta(2) - alpha/m*differ'*X(:,2);
    %fprintf('%f %f \n', theta(1), theta(2));
    J_history(iter) = computeCost(X, y, theta);
end;

end
