# Dimensionality Reduction and Classification - MATLAB
## Project 4 - Dimensionality Reduction and Classification <br>CISC 820 Quantitative Foundations:

The codes are included in the `project_codes` directory, which need to be set as
the working directory.

Then the following function can be called in the console.

### Using eigen value decomposition

```matlab
>>> [PCs, variances, images_pc, percents, m, errors] = pca_faces();
OR
>>> [PCs, variances, images_pc, percents, m, errors] = pca_faces('option', "eigen");
```

### Using singular value decomposition

```matlab
>>> [PCs, variances, images_pc, percents, m, errors] = pca_faces('option', "svd");
```

The resulting figures are displayed and also saved in `results/` folder.

## Documentation

The report and slides can be found in the `docs` directory.

## Results (Images and Plots)

- The variance percentage plots, eigenfaces and mean are generated in the `results/PCA_results` directory.
- The reconstructed images are generated in the `results/Reconstruction_results` directory.
- The mean squared error plot is generated in the `results` directory.
