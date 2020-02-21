data = xlsread('heart.csv');
disp('The dataset was loaded sucessfully!');

 X = data(:,1:end-1);% features
 y = data(:,end);% class labels

 X = normalizeFeatures(X);

% data = rand(303,14);
% Cross validation (train: 75%, test: 25%)
cv = cvpartition(size(data,1),'HoldOut',0.25);
idx=cv.test;

% dataTrain = data(~idx,:);
% dataTest  = data(idx,:);
% X_train = dataTrain(:,1:end-1);% features
% y_train=     dataTrain(:,14);   % class labels
% X_test=dataTest(:,1:end-1);% features
% Y_test=     dataTest(:,14);    % class labels

% lambda_values = [0,	0.001,	0.003,	0.01,	0.03,	0.1,	0.3,	1,	3,	10];
% theta = trainLRModel(X_train, y_train, lambda_values) ;
% threshold =0.5;
% y_predicted = predictClass(X_test, theta, threshold);
% disp(Y_test );
% [acc, recall, precision, fScore] = testPerformance(Y_test, y_predicted);
% disp([acc, recall, precision, fScore]);

X_train = X(cv.training,:);% features
y_train = X(cv.training,:);% class labels
X_test = y(cv.test,:);% features
Y_test = y(cv.test,:);% class labels




lambda_values = [0,	0.001,	0.003,	0.01,	0.03,	0.1,	0.3,	1,	3,	10];
theta = trainLRModel(X, y, lambda_values) ;
threshold =0.5;
y_predicted = predictClass(X, theta, threshold);
[acc, recall, precision, fScore] = testPerformance(y, y_predicted);
disp([acc, recall, precision, fScore]);
