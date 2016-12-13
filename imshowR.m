function [ pallet ] = imshowR( map )
%IMSHOWR shows the image map MAP with dandom colors per label
%   Detailed explanation goes here


    m2 = unique(map);
    
    pallet = rand(max(m2)+1, 3);
    
    imshow(map, pallet);

end

