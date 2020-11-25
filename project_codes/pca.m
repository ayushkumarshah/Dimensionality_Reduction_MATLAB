function [PCs, variances, data_pc, percents] = pca(data, varargin)

% Parse optional arguments
parser = inputParser;
valid_option = @(x) x=="eigen" || x=="svd";
addOptional(parser, 'option', "eigen", valid_option);
parse(parser, varargin{:});
option = parser.Results.option;

% Perform PCA
[num_features, num_samples] = size(data);
percents = zeros(1, num_features);
cum_percents = zeros(1, num_features);
means = mean(data, 2);
data = data - means * ones(1, num_samples);

if option == "eigen"
    var_data = data * data' ./ (num_samples - 1);
    [eig_vectors, eig_values] = eig(var_data);
    % Sort accordind to the decreasing eigen values (variances)
    [variances, idx] = sort(diag(eig_values), 'descend');
    PCs = eig_vectors(:, idx);   

elseif option == "svd"
    [U, S] = svd(data / sqrt(num_samples - 1));
    PCs = U;
    variances = diag(S).^2;    
end

% Calculate and plot percentage variance
total_var = sum(variances);
for i=1:length(variances)
    percents(i) = variances(i) / total_var;
    cum_percents(i) = sum(percents(1:i));
end

figpath = "../results/PCA_variances(n="+int2str(num_samples)+")";
plot_varpercents(cum_percents, figpath);
plot_varpercents(cum_percents, figpath, 'zoom', 200);

% Transform data to PCs
data_pc = PCs' * data;
