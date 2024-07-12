function grid=cleanup(grid,original_grid)
    index=find(grid>=0);
    grid(index)=original_grid(index);
end