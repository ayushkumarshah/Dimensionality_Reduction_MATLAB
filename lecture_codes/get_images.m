function [images_sample, labels_sample] = get_images(label)
% Get sample of images with a specified label
% Eg: images_sample = get_images(4);

[images, labels] = read_hw;
idx = find(labels == label);
images_sample = images(:,idx);
labels_sample = labels(idx);
