function error = reconstruct(PCs, images_sub_pc, images_sub, m, k, num_samples)
% Reconstruction using k Principle Components

images_recons = PCs(:, 1:k) * images_sub_pc(1:k, :) + m * ones(1, size(images_sub_pc, 2));
im_show(images_recons, 'title', "Reconstructed faces using "+k+" PCs (n="+num_samples+")", ...
        'save', 1, 'folder', "Reconstruction_results");

% Compute error between original and reconstructed image    
error = MSE(images_recons, images_sub);

end
