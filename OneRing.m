function Loop = OneRing(i,t)
 %计算 one-ring
    A = mod(find(t == i),size(t,1));
    A(A==0) = size(t,1);
    Loop = t(A,:);
    Loop = unique(Loop(:));
    %删除i元
    delete_loc = Loop==i;
    Loop(delete_loc) = [];
     %重构Loop使得Loop是一个有序的one-ring
    Loop = CircleLoop(Loop,t);
end

