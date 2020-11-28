function [PCs, variances, images_pc, percents, m, errors] = pca_faces(varargin)
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

% Reconstruction using k Principle Components on a subset of images
% Generating subset
n_subset = 10;
n_faces = 1;
subset_idx = get_subset(n_subset, n_faces);
images_sub = images(:, subset_idx);
images_sub_pc = images_pc(:, subset_idx);
im_show(images_sub, 'title', "Original faces (n="+num_samples+")", 'save', 1, ...
        'folder', "Reconstruction_results");
    
% Reconstruction varying number of eigen faces
k = [50:50:250, 275:25:400];
errors = zeros(1, length(k));
for i=1:length(k)
    errors(i) = reconstruct(PCs, images_sub_pc, images_sub, m, k(i), num_samples);
end

figure;
plot(k, errors, 'LineWidth', 3);
figname = "../results/mse";
xlabel('Principle Components (Eigen faces)', 'fontsize', 16)
ylabel('Mean Squared error (MSE)', 'fontsize', 16)
title("Reconstruction error", 'fontsize', 20)
saveas(gcf, figname, "png");
end
