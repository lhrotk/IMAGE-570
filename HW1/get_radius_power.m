function radius_power = get_radius_power(FFTArray)
%RADIUS_POWER Summary of this function goes here
%   Detailed explanation goes here
[M, N] = size(FFTArray);
radius_power = zeros(1, N/2);
total_power = 0;
for i = 1:M
    for j = 1:N
        total_power = total_power + FFTArray(i,j)^2;
    end
end
for r=1:N/2
    temp_power=0;
    for i=1:M
        for j = 1:N
            if r^2 > ((i-M/2)^2 + (j-N/2)^2)
                temp_power = temp_power + FFTArray(i,j)^2;
            end
        end
    end
    radius_power(1, r) = temp_power/total_power;
end
end

