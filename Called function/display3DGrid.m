function display3DGrid(grid)
    [layers,rows,cols]=size(grid);
    for i=1:1:layers
        display_layer=zeros(rows,cols);
        for j=1:1:rows
            for k=1:1:cols
                display_layer(j,k)=grid(i,j,k);
            end
        end
        display2DGrid(display_layer,i);
        title(['layer',num2str(i)])
    end
end