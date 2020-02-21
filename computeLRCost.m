function [cost, grad] = computeLRCost(x, y, theta, lambda)

m = length(y); % number of training examples

cost = 0;
grad = zeros(size(theta));


% calculate cost function
h = sigmoid(x*theta);
cost = 1/m*sum((-y).*log(h)-((1-y).*log(1-h)))+(1/(2*m))*lambda*sum(theta.^2);

% calculate grads
grad = (x'*(h - y)+lambda*theta)/m;


end