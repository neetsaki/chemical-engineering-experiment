%dsolve('Dy1=-a*y1*y2+b*y3^2','Dy2=-a*y1*y2+b*y3^2','Dy3=a*y1*y2-b*y3^2','y1(0)=0.447727','y2(0)=0.656743','y3(0)=0','x')
etoh_0=0.475377;
HAc_0=0.524623;
EAc=[0 0.281671789 0.289892872,0.305835335 0.317704658 0.333625329 0.329109328];
etoh=[etoh_0 0.198114561 0.191943964 0.174541979 0.161890305 0.162671618 0.152153402];
HAc=[HAc_0 0.238541861 0.228270292 0.213787351 0.202700378 0.170077724 0.189627943];
t0=[0 25 35 45 55 65 75];
%t0=[0 20 30 40 50 60 70];
t1=[0 30 40 50 60 70 80];
t2=[0 40 50 60 70 80 90];
tspan=0:1:105;
y0=[HAc_0,etoh_0,0];
b=0.05;a=0.15;
%b=0.035;a=0.12;
error=[];
EAc_error=[];
etoh_error=[];
HAc_error=[];
b_t=[];a_t=[];
for i=1:1:200
odefun3=@(x,Y)([-a*Y(1)*Y(2)+b*Y(3)^2;-a*Y(1)*Y(2)+b*Y(3)^2;a*Y(1)*Y(2)-b*Y(3)^2]);
[t,x]=ode15s(odefun3,tspan,y0);
%储存png图片
% figure();
% plot(t,x(:,3));hold on;
% plot(t,x(:,2));hold on;
% plot(t,x(:,1));hold on;
% scatter(t0,EAc,'*');hold on;
% scatter(t0,etoh,'*');hold on;
% scatter(t0,HAc,'*');hold on;
% %pause(0.1)
% print(1,'-dbmp',sprintf('image/%d',i))
% close;
%计算误差
EAc_pred=x([0 25 35 45 55 65 75]+1,3);
etoh_pred=x([0 25 35 45 55 65 75]+1,2);
HAc_pred=x([0 25 35 45 55 65 75]+1,1);
EAc_error=[EAc_error pdist([EAc;EAc_pred'],'euclidean')];
etoh_error=[etoh_error pdist([etoh;etoh_pred'],'euclidean')];
HAc_error=[HAc_error pdist([HAc;HAc_pred'],'euclidean')];
error=[error [pdist([EAc;EAc_pred'],'euclidean');pdist([etoh;etoh_pred'],'euclidean');pdist([HAc;HAc_pred'],'euclidean')]];
b_t=[b_t b];a_t=[a_t a];
if i>1
    da=b_t(i)-b_t(i-1);
    db=a_t(i)-a_t(i-1);
    dyda=(mean(error(:,i))-mean(error(:,i-1)))/da;
    dydb=(mean(error(:,i))-mean(error(:,i-1)))/db;
    b=b-0.001*dydb/sqrt(i);
    a=a-0.001*dyda/sqrt(i);
else
    b=b-0.1;
    a=a-0.1;
    continue
end
end
plot(1:1:length(a_t),a_t)
plot(1:1:length(error(1,:)),error(1,:))

%依次读取生成的所有图片
% for j=1:160
%     %获取当前图片
%     A=imread(sprintf('image/%d.bmp',j));
%     [I,map]=rgb2ind(A,256);
%     %生成gif，并保存
%     if(j==1)
%         imwrite(I,map,'movefig.gif','DelayTime',0.5,'LoopCount',Inf)
%     else
%         imwrite(I,map,'movefig.gif','WriteMode','append','DelayTime',0.5)    
%     end
% end

