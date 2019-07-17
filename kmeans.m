clear
clc
data=load('ex7data2.mat'); % importing the data
x=data.X;
m=size(x);
x=[x zeros(m(1),1)];
cluster=3;   % number of clusters
hold on
% selecting random cluster centroid from the given data
for i=1:cluster
   
    cent1(i,:)=x(ceil(rand(1)*m));
end
   

for ab=1:5000
for i=1:m(1)
    
   for j=1:cluster
       a(j)=norm(cent1(j,:)- x(i,1:2)).^2; % Distance between cluster centroids and data sets
    
   end
   [min1,ind1]=min(a);      % comapring the distances
    x(i,m(2)+1)=ind1;
end



% calculating the average(new cluster centroids)
avg1=zeros(m(2),cluster);
a1=zeros(cluster,1);
for j=1:cluster
for i=1:m(1)
    if (x(i,m(2)+1)==j)
        avg1(:,j)=avg1(:,j)+x(i,1:m(2))';
        a1(j)=a1(j)+1;
    end
end
cent2(j,:)=(avg1(:,j)./a1(j))';
end

% condition to exit the loop
if (cent2==cent1)
   break;
else
    cent1=cent2;
end

ab
end

hold on
% plotting the clusters
for j=1:cluster
    color=rand(3,1);
for i=1:m(1)
    if (x(i,m(2)+1)==j)
        plot(x(i,1),x(i,2),'o','MarkerEdge',color);
    end
end
end
plot(cent1(:,1),cent1(:,2),'k*'); % plotting the final cluster centroid
