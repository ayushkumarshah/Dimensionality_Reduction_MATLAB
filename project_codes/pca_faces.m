function [PCs, variances, images_pc, percents, m] = pca_faces(varargin)
% Eg call: >> pca_faces();
% Eg call: >> pca_faces(50);
% Eg call: >> pca_faces(50, 'option', "svd");
% args: num_samples = number of sample images to use: (1 - 400)

images = read_images();

% Parse optional arguments
parser = inputParser;
valid_option = @(x) x=="eigen" || x=="svd";
addOptional(parser, 'num_samples', size(images, ndims(images)));
addOptional(parser, 'option', "eigen", valid_option);
parse(parser, varargin{:});
option = parser.Results.option;
num_samples = parser.Results.num_samples;

images = images(:, 1:num_samples);

% Mean of the dataset
m = mean(images, 2);
im_show(m, 'title', "Mean (n="+num_samples+")", 'save', 1);

if option=="eigen"
    [PCs, variances, images_pc, percents] = pca(images, 'option', "eigen");
elseif option=="svd"
    [PCs, variances, images_pc, percents] = pca(images, 'option', "svd");
end

im_show(PCs, 5, 'title', "First 5 PCs (n="+num_samples+")", 'save', 1);
% im_show(PCs, 'num_images', 5, 'title', "First 5 PCs");

% Reconstruction using k Principle Components
k = 100;
images_recons = PCs(:, 1:k) * images_pc(1:k, :) + m * ones(1, size(images, 2));
im_show(images_recons, 5, 'title', "Reconstructed faces using "+k+" PCs (n="+num_samples+")", 'save', 1);
im_show(images, 5, 'title', "Original faces (n="+num_samples+")", 'save', 1);

end
