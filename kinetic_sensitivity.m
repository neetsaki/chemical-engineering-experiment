matrix=[];
% for alpha=0:0.1:1
%     etoh_0=alpha;
% HAc_0=1-alpha;
% a=0.1320;
% b=0.0320;
% tspan=0:1:105;
% y0=[HAc_0,etoh_0,0];
% odefun3=@(x,Y)([-a*Y(1)*Y(2)+b*Y(3)^2;-a*Y(1)*Y(2)+b*Y(3)^2;a*Y(1)*Y(2)-b*Y(3)^2]);
% [t,x]=ode15s(odefun3,tspan,y0);
% %plot(1:1:length(x(:,3)),x(:,3));hold on;
% matrix=[matrix x(:,3)];
% end
% alpha_list=0:0.1:1;
% [xx,yy]=meshgrid(alpha_list,tspan);
% surf(xx,yy,matrix)
for alpha=0:0.01:1
     etoh_0=alpha;
HAc_0=1-alpha;
a=0.1320;
b=0.0320;
tspan=0:1:105;
y0=[HAc_0,etoh_0,0];
odefun3=@(x,Y)([-a*Y(1)*Y(2)+b*Y(3)^2;-a*Y(1)*Y(2)+b*Y(3)^2;a*Y(1)*Y(2)-b*Y(3)^2]);
[t,x]=ode15s(odefun3,tspan,y0);
HAc_last=x(end,3);
matrix=[matrix HAc_last];
end
plot(0:0.01:1,matrix)

