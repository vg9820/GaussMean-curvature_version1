function CBoundary = CircleLoop(Boundary,t)
%��Boundary�е�Ԫ����˳��Բ��
CBoundary = [];
%��a0Ϊ��ʼԪ
a0 = Boundary(1);
CBoundary = [CBoundary,a0];
for i = 1:length(Boundary)
    A = mod(find(t == a0),size(t,1));
    A(A==0) = size(t,1);
    Loop = t(A,:);
    Intersection = setdiff(intersect(Loop,Boundary),CBoundary);
    if(isempty(Intersection))
        break;
    end
    a0 = Intersection(1);
    CBoundary = [CBoundary,a0];
end

