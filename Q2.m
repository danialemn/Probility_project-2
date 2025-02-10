clc
clear
close all
%%
u = rand(1,20000);
X = u<0.3;
M = [];
for i=1:1:numel(X)
    if X(i)
        M = [M 1];
    else
        M = [M -1];
    end
end
hist(M,50)
xlim([-1.5,1.5])
xlabel("voltag")
ylabel("number")
title("voltage Modulated")
%% 
x = rand(1,20000);
n1 = 1.5/0.5*(x - mean(x));
hist(n1,50)
xlim([-3,3])
xlabel("voltage")
ylabel("number")
%%
x2 = rand(1,20000);
n2 = 1.5/0.5*(x2 - mean(x2));
n3 = n1 + n2;
hist(n3,50)
xlim([-3,3])
xlabel("voltage")
ylabel("number")
title("n3 = n1 + n2")
%%
y = n3 + M;
hist(y,50)
xlim([-5,5])
xlabel("voltage")
ylabel("number")
title("y = n3 + M")
%%
x = rand(1,0.7*20000);
n1 = 1.5/0.5*(x - mean(x));
x2 = rand(1,0.7*20000);
n2 = 1.5/0.5*(x2 - mean(x2));
n3 = n1 + n2;
n4 = (n3 - mean(n3)) - 1;
x = rand(1,0.3*20000);
n1 = 1.5/0.5*(x - mean(x));
x2 = rand(1,0.3*20000);
n2 = 1.5/0.5*(x2 - mean(x2));
n3 = n1 + n2;
n5 = (n3 - mean(n3)) + 1;
hold on
histogram(n4 ,100)
histogram(n5 ,100)
%%
hold on
[N4,e4] = histcounts(n4,"Normalization","pdf");
out4 = ((e4(1:end - 1)+e4(2:end))/2);
bar(out4,0.7*N4)
[N5,e5] = histcounts(n5,"Normalization","pdf");
out5 = ((e5(1:end - 1)+e5(2:end))/2);
bar(out5,0.3*N5)

%% 
y2 = [];
for i=1:1:numel(y)
    if y(i)>0.88
        y2 = [y2 1];
    else
        y2 = [y2 0];
    end
end
eror = sum(y2 ~= M)/20000