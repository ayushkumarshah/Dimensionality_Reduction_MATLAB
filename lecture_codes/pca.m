function [PCs, variances, Y] = pca(X, varargin)
parser = inputParser;
valid_option = @(x) x=="eigen" || x=="svd";
addParameter(parser, 'option', "eigen", valid_option);
parse(parser, varargin{:});
option = parser.Results.option;

% Perform PCA
means = mean(X, 2);
X = X - means;

if option == "eigen"
    [eig_vectors, eig_values] = eig(X * X');
    % Sort accordind to the decreasing eigen values (variances)
    [variances, idx] = sort(diag(eig_values), 'descend');
    PCs = eig_vectors(:, idx);   

elseif option == "svd"
    [U, S] = svd(X);
    PCs = U;
    variances = diag(S);
end

Y = PCs' * X;
