function [Ix, Iy] = imgGrad2(I)
% This function outputs the x-derivative and y-derivative of the
% input I. If I is 3D, then derivatives of each channel are
% available in xd and yd.
Ix=zeros(size(I));
Iy=zeros(size(I));

sob=[-1,9,-45,0,45,-9,1]/60;
for j=1:size(I,4)
    for i=1:size(I,3)
        Ix(:,:,i,j)=imfilter(I(:,:,i,j),sob,'replicate');
        Iy(:,:,i,j)=imfilter(I(:,:,i,j),sob','replicate');
    end
end
