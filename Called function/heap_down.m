function array = heap_down(array, i)
    N=size(array, 1);
    while i<=N
        left_node=2*i;
        right_node=2*i+1;
        if right_node<=N
            min_leaf=left_node+(array(left_node, 4)>=array(right_node, 4));
        elseif left_node<=N
            min_leaf=left_node;
        else
            break;
        end
        if array(min_leaf,4)<array(i,4)
            array([i,min_leaf], :)=array([min_leaf,i],:);
            i=min_leaf;
        else
            break;
        end
    end
end
