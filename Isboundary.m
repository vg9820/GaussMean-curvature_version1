function Boundary = Isboundary(x,t)
% �жϱ߽�㣬���ر߽������
Boundary = [];
for i = 1:size(x,1)
    A = mod(find(t == i),size(t,1));
    A(A==0) = size(t,1);
    Loop = t(A,:);
    %�����һ��loop,��ôA�в�ͬԪ�صĸ���Ϊsize(A,1)+1��
    n = length(unique(Loop(:)));
    if(n~= size(A,1)+1)
        Boundary = [Boundary,i];
    end
end

