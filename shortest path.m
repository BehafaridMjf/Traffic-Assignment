function [path1,d] = GraphShortestPath(NumofNodes,Links,Weights,start,stop,iteration)
    s = [];
    t = [];
    for i = 1: NumofNodes
        for j = 1:NumofNodes
            if Links(i,j)==1
                s = [s,i];
                t = [t,j];
            end
        end
    end
%     figure
    G = digraph(s,t,Weights);
    [path1,d] = shortestpath(G,start,stop);
%     p = plot(G,'EdgeLabel',G.Edges.Weight);
%     title (['edge weight = T and iteration = ',num2str(iteration)]);
%     highlight(p,path1,'EdgeColor','g')
end
