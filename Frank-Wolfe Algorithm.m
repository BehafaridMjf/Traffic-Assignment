function [T,X,error] = FrankWolfAlgorithmNetwork(NumofNodes, OriginalDestination, Links, LinksArrCoeff, ErrorThreshold)

    NumofLinks = sum(sum(Links));
    iteration = 0
    XStarNew = zeros(NumofLinks,NumofLinks);
    XStar = zeros(1,NumofLinks)
    X = zeros(1,NumofLinks)
%     PlotGraph(NumofNodes,Links,X,iteration);
    for i = 1:NumofLinks
            T(1,i) = LinksArrCoeff(i,1)*(1+LinksArrCoeff(i,2)*((X(1,i)/LinksArrCoeff(i,3))^LinksArrCoeff(i,4)));
    end
    T
%     figure(1);
% 
%    PlotGraph(NumofNodes,Links,T);
iteration = 1
    for i = 1:NumofNodes
        for j = 1: NumofNodes
            if OriginalDestination(i,j)~=0
                [path1,d] = GraphShortestPath(NumofNodes,Links,T,i,j,iteration);
                for k = 1:size(path1,2)-1
                    XStarNew(path1(1,k),path1(1,k+1)) = XStarNew(path1(1,k),path1(1,k+1)) + OriginalDestination(i,j);
                end
            end
        end
    end
    
    k = 1;
    for i = 1: NumofNodes
        for j = 1:NumofNodes
            if Links(i,j)==1
                XStar(1,k) = XStarNew(i,j);
                k = k + 1;
            end
        end
    end
    XStar
    X = XStar
    
%     PlotGraph(NumofNodes,Links,X,iteration);
    for i = 1:NumofLinks
                T(1,i) = LinksArrCoeff(i,1)*(1+LinksArrCoeff(i,2)*((X(1,i)/LinksArrCoeff(i,3))^LinksArrCoeff(i,4)));
    end
    T
%    figure(2);
%     PlotGraph(NumofNodes,Links,T);
%     PlotGraph(NumofNodes,Links,X);

    error = Inf
    while (abs(error) > ErrorThreshold)
        XStarNew = zeros(NumofLinks,NumofLinks);
        for i = 1:NumofNodes
            for j = 1: NumofNodes
                if OriginalDestination(i,j)~=0
                    [path1,d] = GraphShortestPath(NumofNodes,Links,T,i,j,iteration);
                    for k = 1:size(path1,2)-1
                        XStarNew(path1(1,k),path1(1,k+1)) = XStarNew(path1(1,k),path1(1,k+1)) + OriginalDestination(i,j);
                    end
                end
            end
        end

        k = 1;
        for i = 1: NumofNodes
            for j = 1:NumofNodes
                if Links(i,j)==1
                    XStar(1,k) = XStarNew(i,j);
                    k = k + 1;
                end
            end
        end
        XStar
        Landa = solvelanda(NumofLinks,XStar,X,LinksArrCoeff);
        XNew = Landa*XStar + (1-Landa)*X;
        X = XNew
        iteration = iteration + 1
        PlotGraph(NumofNodes,Links,X,iteration);
        for i = 1:NumofLinks
                T(1,i) = LinksArrCoeff(i,1)*(1+LinksArrCoeff(i,2)*((X(1,i)/LinksArrCoeff(i,3))^LinksArrCoeff(i,4)));
        end
        T
       
%         figure(3);
%         PlotGraph(NumofNodes,Links,T);

        error = X*T'/(XStar*T')-1
        
    end
    


end
