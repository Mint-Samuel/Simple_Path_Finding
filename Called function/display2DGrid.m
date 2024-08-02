function display2DGrid(grid,layer)
    persistent figHandles;

    if isempty(figHandles)
        figHandles = struct();
    end
    if ~isfield(figHandles, ['layer' num2str(layer)]) || ~isvalid(figHandles.(['layer' num2str(layer)]))
        figHandles.(['layer' num2str(layer)]) = figure('Name', ['Layer ' num2str(layer)]);
    else
        figure(figHandles.(['layer' num2str(layer)]));
        clf(figHandles.(['layer' num2str(layer)]));
    end

    [rows,cols] = size(grid);
    colormap("Jet");
    maze = grid;
    plotmaze = ones(rows+1,cols+1);
    plotmaze(1:rows,1:cols) = maze;
    pcolor([1:cols+1],[rows+1:-1:1],plotmaze);
    axis off;
    axis equal;
    colorbar;
end