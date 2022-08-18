function Landa = solvelanda(Numoflinks,XStar,X,LinksArrCoeff)
        syms landa
        LeftSideEqu = 0;
        RightSideEqu = 0;
     
        for ii = 1: Numoflinks
            LeftSideEqu = LeftSideEqu + X(1,ii)* LinksArrCoeff(ii,1)*(1+LinksArrCoeff(ii,2)*((landa*XStar(1,ii)+(1-landa)*X(1,ii))/LinksArrCoeff(ii,3))^LinksArrCoeff(ii,4));
            RightSideEqu = RightSideEqu + XStar(1,ii)*LinksArrCoeff(ii,1)*(1+LinksArrCoeff(ii,2)*((landa*XStar(1,ii)+(1-landa)*X(1,ii))/LinksArrCoeff(ii,3))^LinksArrCoeff(ii,4)); 
        end
        eqn = LeftSideEqu - RightSideEqu == 0;
        answer = vpa(solve(eqn, landa));
        for i = 1:size(answer,1)
            if imag(answer(i,1)) == 0 && answer(i,1)>0 
                Landa = double(answer(i,1));
            end
        end
        
end
