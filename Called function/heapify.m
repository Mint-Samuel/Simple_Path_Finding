function wavefront=heapify(wavefront)
    length_of_wavefront=size(wavefront,1);
    last_inner_node=floor(length_of_wavefront/2);
    for i=last_inner_node:-1:1
        wavefront=heap_down(wavefront,1);
    end
end