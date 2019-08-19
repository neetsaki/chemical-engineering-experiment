function dydx=odefun3(x,Y)
dydx=zeros(3,1);
dydx(1)=-a*Y(1)*Y(2)+b*Y(3)^2;
dydx(2)=-a*Y(1)*Y(2)+b*Y(3)^2;
dydx(3)=a*Y(1)*Y(2)-b*Y(3)^2;
end

