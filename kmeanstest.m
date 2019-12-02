rng('default')  % For reproducibility
im = load('Sameiro_Trees.mat');
data = im.hsi;
[x,y,z] = size(data);

% Reshape
rdata = reshape(data,[x*y,z]);

% Finding index value, kmeans
num = svd(rdata);
% plot(num);
% [n] = index(num);

cl = kmeans(rdata,4);

% Reshape
sdata = reshape(cl,[x,y]);

mean1 = mean(rdata(cl==1,:));
mean2 = mean(rdata(cl==2,:));
mean3 = mean(rdata(cl==3,:));

std1 = std(rdata(cl==1,:));
std2 = std(rdata(cl==2,:));
std3 = std(rdata(cl==3,:));

figure('Name','Prumer','NumberTitle','off');
x=1:33;
ciplot(mean1-std1,mean1+std1,x,'c');
hold on
ciplot(mean2-std2,mean2+std2,x,'y');
hold on
ciplot(mean3-std3,mean3+std3,x,'m');
hold on
plot(x,mean1,'b',x,mean2,'g',x,mean3,'k');
hold off
grid


var1 = var(rdata(cl==1,:));
var2 = var(rdata(cl==2,:));
var3 = var(rdata(cl==3,:));

figure('Name','Rozptyl','NumberTitle','off');
x=1:33;
plot(x,var1,x,var2,x,var3);


% Output
figure
c = jet(4);
cmap = colormap(c);
imshow(sdata,cmap);



% function [n] = index(x)
%     mean = sum(x)/length(x);
%     N = [];
%     for i = 1:(length(x)-1)
%         if ((x(i)-x(i+1))>mean)
%             N = [N; i+1];
%         end
%     end
%     n=N;
% end


% 
% function [n] = display(x)
%    
% end