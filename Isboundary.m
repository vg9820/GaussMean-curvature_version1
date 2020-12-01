function Boundary = Isboundary(x,t)
% 判断边界点，返回边界点数组
Boundary = [];
for i = 1:size(x,1)
    A = mod(find(t == i),size(t,1));
    A(A==0) = size(t,1);
    Loop = t(A,:);
    %如果是一个loop,那么A中不同元素的个数为size(A,1)+1；
    n = length(unique(Loop(:)));
    if(n~= size(A,1)+1)
        Boundary = [Boundary,i];
    end
end

