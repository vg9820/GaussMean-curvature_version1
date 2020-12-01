function Mean_cur = Mean_curvature(MixArea,x,t)
%计算平均曲率
Mean_cur = [];
Boundary = Isboundary(x,t);
for i =1:size(x,1)
    %边界点处平均曲率记为0
    Loc = find(Boundary == i);
    if(~isempty(Loc))
         Mean_cur = [Mean_cur,0]; 
         continue;
    end
    
    Loop = OneRing(i,t);
    m = length(Loop);
    %计算平均曲率
    Ki = 0;
    for j = 1:length(Loop)
        j1 = j;
        j0 = mod(j-1,m);
        if(j0 == 0)
            j0 = m;
        end
        j2 = mod(j+1,m);
        if(j2 == 0)
            j2 = m;
        end
        v0 = x(i,:);
        v1 = x(Loop(j1),:);
        v2 = x(Loop(j0),:);
        v3 = x(Loop(j2),:);
        
        e = v0 - v1;
        
        e21 = v2 - v0;
        e22 = v2 - v1;
        alpha2 = acos(dot(e21,e22)/(norm(e21)*norm(e22)));
        
        e31 = v3 - v0;
        e32 = v3 - v1;
        alpha3 = acos(dot(e31,e32)/(norm(e31)*norm(e32)));
        
        Ki = Ki + (cot(alpha2) + cot(alpha3))*e;
    end
    Hi = 0.25 * norm(Ki) /MixArea(i);
    Mean_cur = [Mean_cur,Hi]; 
end

