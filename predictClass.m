function y = predictClass(x, theta, threshold)
m = size(x, 1); 
y= zeros(m, 1);
y = sigmoid(x * theta) >= threshold;

end