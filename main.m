clear;
original_data=load("E:/Documents/Programme/Opensource/Simple_Path_Finding/testbench/tb_netlist_5.mat");
grid=original_data.grid;
netlist=original_data.netlist;
wavefront=[];
direction=[];
path_line=[];
flag_found=0;
[layers,rows,cols]=size(grid);
flag_of_sum=sum(grid,"all")/(layers*rows*cols);
for net_up=1:1:length(netlist)
    path_line=[];
    net_now=netlist{net_up};
    direction(net_now(1,1),net_now(1,2),net_now(1,3))=0;
    [pin_numbers,~]=size(net_now);
    for target_up=2:1:pin_numbers
        target=net_now(target_up,:);
        if ~isempty(path_line)
            for i=1:1:length(path_line)
                wavefront=[wavefront;path_line(i,:),1];
            end
        else
            s_z=net_now(1,1);
            s_x=net_now(1,2);
            s_y=net_now(1,3);
            wavefront=[net_now(1,:),original_data.grid(s_z,s_x,s_y)];
        end
        flag_found=0;
        while ~isempty(wavefront)&&flag_found==0
            if target_up==2 && flag_of_sum<=1
                current_position=wavefront(1,:);
                wavefront(1,:)=[];
            else
                wavefront=heapify(wavefront);
                [wavefront,current_position]=popTop(wavefront);
            end
            z=current_position(1);x=current_position(2);y=current_position(3);
            pathcost=current_position(4);
            [grid,wavefront,direction]=extension(grid,wavefront,direction,layers,rows,cols,current_position,net_up,original_data.grid);
            current_position_judge(1)=current_position(1);current_position_judge(2)=current_position(2);current_position_judge(3)=current_position(3);
            if isequal(current_position_judge,target)
                [grid,path_line]=backtrace(grid,direction,target,path_line,net_up);
                index=find(grid<0);
                old_grid(index)=grid(index);
                grid=cleanup(grid,original_data.grid);
                wavefront=[];
                flag_found=1;
                break;
            end
        end
        if flag_found==0
            fprintf("Net ");
            fprintf(num2str(net_up));
            fprintf(" cannot find a route.")
            disp(" ");
            grid=cleanup(grid,original_data.grid);
        end
    end
    index=find(old_grid<0);
    grid(index)=old_grid(index);
end
display3DGrid(grid);
