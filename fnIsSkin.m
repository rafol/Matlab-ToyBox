function [ mask ] = fnIsSkin( im, cs )
    [lin col prof] = size(im);
    
    if nargin<2
        cs = 'HSV';
    end
    switch cs
        case 'RGB'
            R = im(:,:,1);
            G = im(:,:,2);
            B = im(:,:,3);
            M = max(im,[],3);
            m = min(im,[],3);
            a = abs(R-G);
            Rg = R>G;
            Rb = R>B;
            mask = zeros(lin,col);
            mask(R>95 & G>40 & B>20 & (M-m)>15 & a>15 & Rg==1 & Rb==1) = 1;
        case 'HSV'
            hsv = rgb2hsv(im);       
            H = hsv(:,:,1);
            S = hsv(:,:,2);
            V = hsv(:,:,3);
            H = H*360; S = S*255; V = V*255;
            mask = zeros(lin,col);
            mask(H<20 & S>75 & S<190) = 1; 
        case 'HSV1'
            hsv = rgb2hsv(im);       
            H = hsv(:,:,1);
            S = hsv(:,:,2);
            V = hsv(:,:,3);
            H = H*360; S = S; V = V*100;
            mask = zeros(lin,col);
            mask(V>40 & (0<H & H<25 | 355<H & H<360) & (0.2<S & S<0.6) ) = 1; 
        case 'rgb'
            R = im(:,:,1);
            G = im(:,:,2);
            B = im(:,:,3);
            r = R./(R+G+B);
            g = G./(R+G+B);
            b = B./(R+G+B);
            mask = zeros(lin,col);
            mask(r./g > 1.185 & r.*b ./ (r+g+b).^2 > 0.107 & r.*g ./ (r+g+b).^2 > 0.112) = 1;
    end
end


