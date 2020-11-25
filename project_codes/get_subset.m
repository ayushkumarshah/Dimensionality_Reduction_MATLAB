function images_sub = get_subset(images, num_subjects)
% Get subset of images from different subjects

rand('seed', 1);
subjects = randperm(40, num_subjects);
X = randperm(10, 1);
images_sub = zeros(size(images, 1), num_subjects);

for i=1:num_subjects
    images_sub(:, i) = images(:, subjects(i) * 10 + X);
end

