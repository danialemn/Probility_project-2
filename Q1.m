clc
clear
close all
%% قسمت الف
v = [0 1 0 1 1 1 1 0 0 1 0 0 1 1 0];
m = [];
M = [];
i = 1;
while i<=numel(v)-2;

    m  =[v(i) v(i+1) v(i+2)];
        if m == [0 0 0]
            M = [M 0.5];
        elseif m == [0 0 1]
            M = [M 1.5];
        elseif m == [0 1 0]
            M = [M 2.5];
        elseif m == [0 1 1]
            M = [M 3.5];
        elseif m == [1 0 0]
            M = [M -0.5];
        elseif m == [1 0 1]
            M = [M -1.5];
        elseif m == [1 1 0]
            M = [M -2.5];
        elseif m == [1 1 1]
            M = [M -3.5];
        end
        m = [];
        i = i+3;
end
t = 0:1:numel(v)/3;
stairs(t,[M,M(end)],"LineWidth",1.5)
xlabel("time(ms)")
ylabel("voltage")
title("Modulated")
grid on
xlim([0,5])
ylim([-4,4])
%% قسمت ب
clc
clear
u = rand(1,30000);
X = u<0.8;
hist(X,50);
grid on
xlabel("outcome")
ylabel("number")
title("30k bits")
xlim([-0.5,1.5])
ylim([-2,30000])
%% قسمت ج
v = X;
m = [];
M = [];
i = 1;
while i<=numel(v)-2;

    m  =[v(i) v(i+1) v(i+2)];
        if m == [0 0 0]
            M = [M 0.5];
        elseif m == [0 0 1]
            M = [M 1.5];
        elseif m == [0 1 0]
            M = [M 2.5];
        elseif m == [0 1 1]
            M = [M 3.5];
        elseif m == [1 0 0]
            M = [M -0.5];
        elseif m == [1 0 1]
            M = [M -1.5];
        elseif m == [1 1 0]
            M = [M -2.5];
        elseif m == [1 1 1]
            M = [M -3.5];
        end
        m = [];
        i = i+3;
end
hist(M,50);
xlabel("voltage")
ylabel("number")
title("30k bits Modulated")
grid on
%% قسمت د
noise = [];
for i=1:1:10000;
    k = rand(1);
    if 0<=k<0.02
        b = -3;
    elseif 0.02<=k && k<0.05
        b = -2;
    elseif 0.05<=k && k<0.1
        b = -1;
    elseif 0.1<=k && k<0.9
        b = 0;
    elseif 0.9<=k && k<0.95
        b = 1;
    elseif 0.95<=k && k<0.98
        b = 2;
    elseif 0.98<=k && k<1
        b = 3;
    end
    noise = [noise b];

end
%%
hist(noise,50)
xlim([-3.5,3.5])
xlabel("voltage noise")
ylabel("number")
title("noise Modulated")
%%
y = noise + M; %voltage
y2 = []; % 0 , 1
for i=1:1:numel(y)
        
        if y(i) == -3.5
            y2 = [y2 1 1 1];
        elseif y(i) == -2.5
            y2 = [y2 1 1 0];
        elseif y(i) == -1.5
            y2 = [y2 1 0 1];
        elseif y(i) == -0.5
            y2 = [y2 1 0 0];
        elseif y(i) == 3.5
            y2 = [y2 0 1 1];
        elseif y(i) == 2.5
            y2 = [y2 0 1 0];
        elseif y(i) == 1.5
            y2 = [y2 0 0 1];
        elseif y(i) == 0.5
            y2 = [y2 0 0 0];
        elseif y(i) > 3.5
            y2 = [y2 0 1 1];
        elseif y(i) < -3.5
            y2 = [y2 1 1 1];
        end

end
%%
hist(y2,50)
xlabel("outcome")
ylabel("number")
title("out put")

%%
eror = sum(X~=y2)/30000
