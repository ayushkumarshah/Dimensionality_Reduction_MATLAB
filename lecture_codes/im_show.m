function im_show(images, varargin)
% Display 28x28 images in subplot

% Eg call: display_images(images, 'labels', labels, 'num_images', 10, 'ncols', 5);
% The input images must be in the shape (784, n); n = no. of images

% Input parser arguments
parser = inputParser;
addOptional(parser,'ncols', 4);
addOptional(parser,'figsize', [4000 1000]);
addOptional(parser,'num_images', size(images, ndims(images)));
addOptional(parser,'labels', 0);
parse(parser, varargin{:});

ncols = parser.Results.ncols;
figsize = parser.Results.figsize;
num_images = parser.Results.num_images;
labels = parser.Results.labels;
position = [10 10 figsize];

% reshape images
images = reshape(images, 28, 28, size(images, ndims(images)));

figure;
set(gcf,'Colormap', gray);

% Case: single image to display
if num_images == 1
    image(images(:, :, 1)');
%     imshow(images(:, :, 1), 'InitialMagnification','fit');
    axis('square')
    if any(labels)
        title(int2str(labels(1)), 'fontsize', 26);
    end
    
% Case: multiple images to display
elseif num_images > 1
    nrows = ceil(num_images / ncols);  % Number of rows
    set(gcf,'Position', position);   % Adjusting figure size
    for i=1:num_images
        subplot(nrows,ncols,i)
        image(images(:, :, i)');
%         imshow(images(:, :, i), 'InitialMagnification','fit');
        axis('square')
        if any(labels)
            title(int2str(labels(i)), 'fontsize', 26);
        end
    end
end