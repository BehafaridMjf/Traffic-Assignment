clc;
clear all;
% NumofNodes = input('Enter the number of Nodes: ');
NumofNodes = 4;
Links = zeros(NumofNodes,NumofNodes);
OriginalDestination = zeros(NumofNodes,NumofNodes);
% OriginalDestination = input('Enter Original Destination: ');
% Links = input('Enter Linkes of the Graph: ' );
NumofLink = sum(sum(Links));
LinksArrCoeff = zeros(NumofLink,4);
% LinksArrCoeff = input('Enter Links Coefficients of the Graph: ' );
% ErrorThreshold = input('Enter error Threshold: ');
ErrorThreshold = 0.0001;

OriginalDestination = zeros(4,4);
OriginalDestination = [0,200,300,600;
         250,0,450,800;
         400,320,0,450;
         200,500,150,0];
NumofNodes = 4;
Links = zeros(4,4);
Links =[0,1,0,0;
         1,0,1,1;
         0,1,0,1;
         0,1,1,0];
NumofLink = sum(sum(Links));
LinksArrCoeff = [10,0.15,1400,4;
                 10,0.15,1400,4;
                 15,0.15,800,4;
                 20,0.15,700,4; 
                 15,0.15,800,4;
                 15,0.15,600,4;
                 20,0.15,700,4; 
                 15,0.15,600,4];
                  
% PlotGraph(NumofNodes,Links,1)                
                 
[T,X,error] = FrankWolfAlgorithmNetwork(NumofNodes,OriginalDestination, Links, LinksArrCoeff, ErrorThreshold);





