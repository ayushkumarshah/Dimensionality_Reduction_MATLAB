function im_show(images, varargin)
% Display 28x28 images in subplot

% Eg call: im_show(images, 'labels', labels, 'num_images', 10, 'ncols', 5);
% The input images must be in the shape (784, n); n = no. of images

% Input parser arguments
parser = inputParser;
addOptional(parser,'num_images', size(images, ndims(images)));
addOptional(parser,'title', "");
addOptional(parser,'ncols', 5);
addOptional(parser,'labels', 0);
addOptional(parser,'save', 0);
addOptional(parser,'folder', "PCA_results");
addOptional(parser,'figsize', [4000 1000]);
parse(parser, varargin{:});

ncols = parser.Results.ncols;
figsize = parser.Results.figsize;
num_images = parser.Results.num_images;
labels = parser.Results.labels;
save = parser.Results.save;
folder = parser.Results.folder;
main_title = parser.Results.title;
position = [10 10 figsize];

% reshape images
images_reshaped = reshape(images, 92, 112, size(images, ndims(images)));

figure;
% set(gcf,'Colormap', gray);

% Case: single image to display
if num_images == 1
%     image(images_reshaped(:, :, 1)');
    imshow(images_reshaped(:, :, 1)', ...
           [min(images(:,1)), max(images(:,1))],...
           'InitialMagnification','fit');
    title(main_title, 'fontsize', 26);
    
% Case: multiple images to display
elseif num_images > 1
    nrows = ceil(num_images / ncols);  % Number of rows
    set(gcf, 'Position', position);
    for i=1:num_images
        subplot(nrows,ncols,i)
%         image(images_reshaped(:, :, i))';
        imshow(images_reshaped(:, :, i)', [min(images(:,i)), max(images(:,i))]);
%         axis('square')
        if any(labels)
            title(labels(i), 'fontsize', 20);
        end
    end
    sgtitle(main_title, 'fontsize', 26)
end

% Save image file
if save
    figpath = "../results/"+folder+"/"+main_title+".png";
    saveas(gcf, figpath);
end
