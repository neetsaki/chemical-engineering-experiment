%���ζ�ȡ���ɵ�����ͼƬ
for j=1:160
    %��ȡ��ǰͼƬ
    A=imread(sprintf('image/%d.bmp',j));
    [I,map]=rgb2ind(A,256);
    %����gif��������
    if(j==1)
        imwrite(I,map,'movefig.gif','DelayTime',0.5,'LoopCount',Inf)
    else
        imwrite(I,map,'movefig.gif','WriteMode','append','DelayTime',0.5)    
    end
end
