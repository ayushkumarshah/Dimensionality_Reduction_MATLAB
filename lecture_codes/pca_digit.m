function [PCs, variances, images_pc, percents, m] = pca_digit(label, varargin)
% Eg call: >>> pca(4);
% Eg call: >>> pca(4, 'option', "svd");

% Parse optional arguments
parser = inputParser;
valid_option = @(x) x=="eigen" || x=="svd";
addOptional(parser, 'option', "eigen", valid_option);
parse(parser, varargin{:});
option = parser.Results.option;

images = get_images(label);

if option=="eigen"
    [PCs, variances, images_pc, percents] = pca(images, 'option', "eigen");
elseif option=="svd"
    [PCs, variances, images_pc, percents] = pca(images, 'option', "svd");

% Mean of the dataset
m = mean(images, 2);
im_show(m, 'title', "Mean");

im_show(PCs, 'num_images', 5, 'ncols', 5, 'title', "First 5 PCs");

% Reconstruction using k Principle Components
k = 100;
images_recons = PCs(:, 1:k) * images_pc(1:k, :) + m * ones(1, size(images, 2));
im_show(images_recons, 'num_images', 5, 'title', "Reconstructed images using "+ k+" PCs");
im_show(images, 'num_images', 5, 'title', "Original images");

end
