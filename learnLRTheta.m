function theta = learnLRTheta(x, y, lambda)

options = optimset('GradObj', 'on', 'MaxIter', 400);
[theta] = ...
	fminunc(@(t)(computeLRCost(x, y, t, lambda)), zeros(size(x,2),1), options);
end