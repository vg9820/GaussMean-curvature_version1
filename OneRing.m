function Loop = OneRing(i,t)
 %���� one-ring
    A = mod(find(t == i),size(t,1));
    A(A==0) = size(t,1);
    Loop = t(A,:);
    Loop = unique(Loop(:));
    %ɾ��iԪ
    delete_loc = Loop==i;
    Loop(delete_loc) = [];
     %�ع�Loopʹ��Loop��һ�������one-ring
    Loop = CircleLoop(Loop,t);
end

