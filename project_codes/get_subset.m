function indices = get_subset(num_subjects, num_faces)
% Get subset of images from different subjects
% Arguments:
% num_subjects - number of subjects out of 40 (1 - 40)
% num_faces - number of faces (images) of each subject
% Returns indices of required subset of images

rand('seed', 1);
subjects = randperm(40, num_subjects);
X = randperm(10, num_faces);
% images_sub = zeros(size(images, 1), num_subjects);
indices = [];
for x=X
    indices = [indices, subjects * 10 + x];
end
