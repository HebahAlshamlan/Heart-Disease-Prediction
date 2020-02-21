function x = normalizeFeatures(x)
[m,n]=size(x);

for i= 1:m
    for j=1:n
        one= x(i,j)-min(x(:,j));
        two = max(x(:,j))-min(x(:,j));
        x(i,j)= one/two;
    end
end

end
