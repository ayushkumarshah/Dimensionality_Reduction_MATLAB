function MSE= MSE(image1, image2)
[M, N] = size(image1);
error = double(image1) - double(image2);
MSE = sum(sum(error .* error)) / (M * N);
end