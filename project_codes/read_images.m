function [images] = read_images
%output: image: nxN matrix, each column is an image
% label: Nx1 vector, label for the digit for each image

data_dir = "../data/att_faces";

file_list = dir(fullfile(data_dir, '**', '*.pgm'));

images = zeros(400, 92*112);

for i = 1:numel(file_list)
  image = imread(fullfile(file_list(i).folder, file_list(i).name));
  images(i, :)  = reshape(image', 92*112, []);
end

images = images';
