clc; clear all; close all;

x = [0 2 5 9 15 25 40];
y = [5 12 23 37 44 60 81];
deg = 5;


for p=0:deg
    for s=0:deg
        if (s==0) && (p==0)
            value_matris(p+1,s+1)= length(x); 
        else
            value_matris(p+1,s+1) = sum(x.^(s+p));
        end
        result_matris(p+1,1)= sum((x.^(p)).*y);
    end
end

a = inv(value_matris)*result_matris;
fx = 0;

for d=0:length(a)-1
    fx = fx + a(d+1,1)*x.^(d);
end

plot(x,y,'k o', x,fx, 'r')
legend('verilen','hesaplanan')




        

