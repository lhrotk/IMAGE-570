function result = mask(I, mask, attackers, x, y)
%MASK Summary of this function goes here
%   Detailed explanation goes here
attackers = squeeze(attackers);
result = false;
for n=1:size(attackers,1)
    match = true;
    for i=1:size(attackers, 2)
        for j=1:size(attackers, 3)
            if attackers(n, i, j) == -1
                continue;
            else
                match = match & (I(x+i-2,y+j-2)==attackers(n, i, j));
            end
        end
    end
    result=result||match;
end
end

