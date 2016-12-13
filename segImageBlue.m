function I_s2 = segImageBlue(I,S)
[cx,cy] = gradient(S);
ccc = (abs(cx)+abs(cy))~=0;
I_s = permute(I, [3 1 2]);
I_s(1, ccc) = 0;
I_s(2, ccc) = 0;
I_s(3, ccc) = 1;
I_s2 = permute(I_s, [2 3 1]);
