function plot_varpercents(cum_percents, figpath, varargin)
% Plot variance percentages

% Parse optional arguments
parser = inputParser;
addOptional(parser, 'figpath', "");
addOptional(parser, 'zoom', 0);
parse(parser, varargin{:});
zoom = parser.Results.zoom;

figure;
plot(cum_percents, 'o')
ylim([0 1.0001])

if zoom
    xlim([0 zoom])
    figpath = figpath+" zoomed in";
end

xlabel('Eigenfaces', 'fontsize', 16)
ylabel('Cumulative Percentage of Variance', 'fontsize', 16)

saveas(gcf, figpath, "png");

end

