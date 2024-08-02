function [array,top]=popTop(array)
    top=array(1,:);
    array(1,:)=array(end,:);
    array(end,:)=[];
    array=heap_down(array,1);
end