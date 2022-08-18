function PlotGraph(NumofNodes,Links,Weights,iteration)
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
    figure
   if size(Weights) == 1
       G = digraph(s,t);
       plot(G);
   else
       G = digraph(s,t,Weights);
       plot(G,'EdgeLabel',G.Edges.Weight);
       title (['edge weight = X and iteration = ',num2str(iteration)]);

   end

end
