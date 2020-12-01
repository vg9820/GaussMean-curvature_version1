function MixArea = Mixed_Area(x,t)
%计算每个顶点的Mixed_Area
MixArea = [];
Boundary = Isboundary(x,t);
for i =1:size(x,1)
    %判断是否为边界点，是将值设为1
    Loc = find(Boundary == i);
    if(~isempty(Loc))
         MixArea = [MixArea,0]; 
         continue;
    end
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
    
    %计算Mixed-Area
    A_m = 0;
    for m = 1:length(Loop)
        n = m+1;
        if(n > length(Loop))
            n = mod(n,length(Loop));
        end
        v0 = x(i,:);
        v1 = x(Loop(m),:);
        v2 = x(Loop(n),:);
        e0 = v1 - v2;
        e1 = v2 - v0;
        e2 = v1 - v0;
        alpha0 = acos(dot(e1,e2)/(norm(e1)*norm(e2)));
        alpha1 = acos(dot(e0,e2)/(norm(e0)*norm(e2)));
        alpha2 = acos(dot(e0,e1)/(norm(e0)*norm(e1)));
        if(alpha0 <= pi/2 && alpha1 <= pi/2 && alpha2 <= pi/2)
            %锐角三角形
            A_m = A_m + 0.125 * (norm(e1)^2*cot(alpha1) + norm(e2)^2*cot(alpha2));
        elseif (alpha0 > pi/2)
            %顶点所属的角为钝角
            A_m = A_m + 0.5 *(0.5 * norm(e1) * norm(e2) * sin(alpha0));
        else
            %临界角为钝角
            A_m = A_m + 0.25 *(0.5 * norm(e1) * norm(e2) * sin(alpha0));
        end       
    end
    MixArea = [MixArea,A_m]; 
end

