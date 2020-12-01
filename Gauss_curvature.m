function Gauss_cur = Gauss_curvature(MixArea,x,t);
%计算平均曲率
Gauss_cur = [];
Boundary = Isboundary(x,t);
for i =1:size(x,1)
    %边界点处平均曲率记为0
    Loc = find(Boundary == i);
    if(~isempty(Loc))
         Gauss_cur = [Gauss_cur,0]; 
         continue;
    end
    
    Loop = OneRing(i,t);
    m = length(Loop);
    
    %计算gauss曲率
    theta_sum = 0;
    for j = 1:m
        j0 = j;
        j1 = j+1;
        if(j1 > m)
            j1 = mod(j1,m);
        end
        v0 = x(i,:);
        v1 = x(Loop(j0),:);
        v2 = x(Loop(j1),:);
        e1 = v1 - v0;
        e2 = v2 - v0;
        theta = acos(dot(e1,e2)/(norm(e1)*norm(e2)));
        theta_sum = theta_sum + theta;
    end
    Ki = 1/MixArea(i)*(2*pi - theta_sum);
    Gauss_cur = [Gauss_cur,Ki]; 
end
end

