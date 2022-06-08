
clc;
clear;
close all;
f = .92;
X = .015;
N =.2;
x = 0 : X : .3;
s = .1: .01 :N ;
b = length(s) ;
a = length(x) ;
y = [0,0];
z = [0,0] ;
syms y
for j = 1 : b
    n = s(j) ;
    t = f .* (x.^n) .* (exp(-x)) ;
    for i = 1 : a
        eqn = (y.^n) .* exp(-y) == t(i)  ;
        Y(i) = vpasolve(eqn,y,[0 1]) ;
    end
    for i = 1:a
       if x(i) <= n
           z(i) = Y(i) ;
           b = i ;
       else 
           z(i) = z(i-1) ;
       end
    end
    hold on 
    xlabel('εb') ;
    ylabel('εa') ;
    text(.1,.45," f = " + num2str(f)) ;
    plot(x,x,"--") ;
    plot(x,z) ;
    %individualize for x 
    text(x(i),x(i)," n = 1 ") 
    text(x(b),z(a)," n = " + num2str(n))
end