function [im, pallet] = imscolor(map)


pallet = rand(size(unique(map),1), 3)

im = ind2rgb(map, pallet);

if nargout==0
    imshow(im);
end
