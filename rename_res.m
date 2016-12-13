ps = 'resr/';
pd = 'res_new/';
arq = dir([ps '*']);
mkdir(pd)
for i=3:length(arq)
    nn = arq(i).name;
    ak2 = dir([ps nn '/*.tif']);
    for j=1:length(ak2)
        nome = [ps nn '/' ak2(j).name];
        im = imread(nome);
        
        novo = ak2(j).name;
        pd2 = [pd novo(1:end-12) '/'];
        mkdir(pd2);
        
        newName = [pd2  novo(1:end-12) nn(end-15:end) novo(end-11:end-4) '.tif'];
        
        imwrite(im, newName);
    end
end