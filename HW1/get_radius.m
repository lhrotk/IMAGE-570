function radius = get_radius(radius_power, ratio)
    [M, N] = size(radius_power);
    for i = 1:N
        if radius_power(1, i)>1-ratio
            radius = i;
            break;
        end
    end
end