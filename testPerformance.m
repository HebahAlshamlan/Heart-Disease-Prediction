function [acc, recall, precision, fScore] = testPerformance(y, y_predicted)

idx = (y()==1);
p = length(y(idx)); %Female 
n = length(y(~idx)); %Male 
N = p+n; % all y
%% confusion matrix %% 
TP = sum(y(idx)==y_predicted(idx));
TN = sum(y(~idx)==y_predicted(~idx));
FP = n-TN;
FN = p-TP;
%% confusion matrix %% 
tp_rate = TP/p;
tn_rate = TN/n;

%% Assign %%
acc = ((TP+TN)/N);
precision = TP/(TP+FP);
recall = tp_rate;
fScore = 2*((precision*recall)/(precision + recall));
end