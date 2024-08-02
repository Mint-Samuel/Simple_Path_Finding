function [grid,wavefront,direction]=extension(grid,wavefront,direction,layers,rows,cols,current_position,net_up,original_grid)
    c_z=current_position(1);c_x=current_position(2);c_y=current_position(3);
    pathcost=current_position(4);
    if c_x+1<=rows&&(grid(c_z,c_x+1,c_y)>0||grid(c_z,c_x+1,c_y)==-1-net_up)
        if ~isempty(direction)&&direction(c_z,c_x,c_y)~=2
            pathcost=pathcost+1.25;%{方向补充%}
        end
        wavefront=[wavefront;c_z,c_x+1,c_y,pathcost+original_grid(c_z,c_x+1,c_y)];
        grid(c_z,c_x+1,c_y)=0;
        direction(c_z,c_x+1,c_y)=2;
    end
    if c_x-1>=1&&(grid(c_z,c_x-1,c_y)>0||grid(c_z,c_x-1,c_y)==-1-net_up)
        if ~isempty(direction)&&direction(c_z,c_x,c_y)~=1;
            pathcost=pathcost+1.25;%{方向补充%}
        end
        wavefront=[wavefront;c_z,c_x-1,c_y,pathcost+original_grid(c_z,c_x-1,c_y)];
        grid(c_z,c_x-1,c_y)=0;
        direction(c_z,c_x-1,c_y)=1;
    end
    if c_y+1<=cols&&(grid(c_z,c_x,c_y+1)>0||grid(c_z,c_x,c_y+1)==-1-net_up)
        if ~isempty(direction)&&direction(c_z,c_x,c_y)~=4;
            pathcost=pathcost+1.25;%{方向补充%}
        end
        wavefront=[wavefront;c_z,c_x,c_y+1,pathcost+original_grid(c_z,c_x,c_y+1)];
        grid(c_z,c_x,c_y+1)=0;
        direction(c_z,c_x,c_y+1)=4;
    end
    if c_y-1>=1&&(grid(c_z,c_x,c_y-1)>0||grid(c_z,c_x,c_y-1)==-1-net_up)
        if ~isempty(direction)&&direction(c_z,c_x,c_y)~=3;
            pathcost=pathcost+1.25;%{方向补充%}
        end
        wavefront=[wavefront;c_z,c_x,c_y-1,pathcost+original_grid(c_z,c_x,c_y-1)];
        grid(c_z,c_x,c_y-1)=0;
        direction(c_z,c_x,c_y-1)=3;
    end
    if c_z+1<=layers&&original_grid(c_z+1,c_x,c_y)==3&&(grid(c_z+1,c_x,c_y)>0||grid(c_z+1,c_x,c_y)==-1-net_up)
        if ~isempty(direction)&&direction(c_z,c_x,c_y)~=5;
            pathcost=pathcost+0;%{方向补充%}
        end
        wavefront=[wavefront;c_z+1,c_x,c_y,pathcost+original_grid(c_z+1,c_x,c_y)];
        grid(c_z+1,c_x,c_y)=0;
        direction(c_z+1,c_x,c_y)=5;
    end
    if c_z-1>=1&&original_grid(c_z-1,c_x,c_y)==3&&(grid(c_z-1,c_x,c_y)>0||grid(c_z-1,c_x,c_y)==-1-net_up)
        if ~isempty(direction)&&direction(c_z,c_x,c_y)~=6;
            pathcost=pathcost+0;%{方向补充%}
        end
        wavefront=[wavefront;c_z-1,c_x,c_y,pathcost+original_grid(c_z-1,c_x,c_y)];
        grid(c_z-1,c_x,c_y)=0;
        direction(c_z-1,c_x,c_y)=6;
    end
end