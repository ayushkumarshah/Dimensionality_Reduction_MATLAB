function [image,label] = read_hw
%output: image: nxN matrix, each column is an image
% label: Nx1 vector, label for the digit for each image
fid = fopen('data/train-images-idx3-ubyte','r');
fid2 = fopen('data/train-labels-idx1-ubyte','r');

mn = fread(fid,4,'uint8');

ni = fread(fid,4,'uint8');

nr = fread(fid,4,'uint8');

nc = fread(fid,4,'uint8');

mn2 = fread(fid2,4,'uint8');
ni2 = fread(fid2,4,'uint8');

label = fread(fid2,60000,'uint8');
% 
% ln0 = length(find(label==0));
% ln1 = length(find(label==1));
% ln2 = length(find(label==2));
% ln3 = length(find(label==3));
% ln4 = length(find(label==4));
% ln5 = length(find(label==5));
% ln6 = length(find(label==6));
% ln7 = length(find(label==7));
% ln8 = length(find(label==8));
% ln9 = length(find(label==9));

image = zeros(60000,28*28);

for i=1:60000
    image(i,:) = fread(fid,28*28,'uint8');
end

image = image';
    