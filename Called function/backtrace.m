function [grid,path_line]=backtrace(grid,direction,target,path_line,net_up)
    t_z=target(1);t_x=target(2);t_y=target(3);
    while grid(t_z,t_x,t_y)~=-1-net_up
        grid(t_z,t_x,t_y)=-1-net_up;
        if direction(t_z,t_x,t_y)==1
            t_x=t_x+1;
            path_line=[path_line;t_z,t_x,t_y];
        elseif direction(t_z,t_x,t_y)==2
            t_x=t_x-1;
            path_line=[path_line;t_z,t_x,t_y];
        elseif direction(t_z,t_x,t_y)==3
            t_y=t_y+1;
            path_line=[path_line;t_z,t_x,t_y];
        elseif direction(t_z,t_x,t_y)==4
            t_y=t_y-1;
            path_line=[path_line;t_z,t_x,t_y];
        elseif direction(t_z,t_x,t_y)==5
            t_z=t_z-1;
            path_line=[path_line;t_z,t_x,t_y];
        elseif direction(t_z,t_x,t_y)==6
            t_z=t_z+1;
            path_line=[path_line;t_z,t_x,t_y];
        end
    end
    grid(t_z,t_x,t_y)=-1-net_up;
end