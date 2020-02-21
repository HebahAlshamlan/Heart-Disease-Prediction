function [theta, lambda] = trainLRModel(x, y, lambda_values) 


CVO = cvpartition(y,'KFold',10);


for h = 1 : 10
    for i = 1:CVO.NumTestSets

        theta = learnLRTheta(x, y, lambda_values(h))

        trIdx = CVO.training(i);
        teIdx = CVO.test(i);

        costT = computeLRCost(x(trIdx,:),y(trIdx,:) ,theta, 0);
        costV = computeLRCost(x(teIdx,:),y(teIdx,:) ,theta, 0);

        errT(i) = costT;
        errV(i) = costV;
    end

%average validation err
cvErrT(h) = sum(errT)/10;
cvErrV(h) = sum(errV)/10;

end

[minval, minidx] = min(cvErrV(:,2));
lambda = lambda_values(minidx);
disp(lambda);



p = plot(lambda_values,cvErrT,lambda_values,cvErrV);
p(1).LineWidth = 2;
p(2).Marker = '*';
legend({'Training','Validation'},'Location','southwest')
xlabel('Lembda') 
ylabel('Theta') 


end