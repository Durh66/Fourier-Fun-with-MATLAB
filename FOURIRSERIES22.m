 
clc;
close all;
syms x n;
a=input('Please enter the number of the functions''s regulations: ');
o=input('Please enter the precisness of the sigma you want to : ');
i=0;
f=sym('x',[a,1]);
while i~=a
    i=i+1;
    f(i,1)=input(['Please enter the  number ' num2str(i) ' regulation of the function y=']);
end
i=0;
d=zeros(a,2);
while i~=a
    i=i+1;
    e=0;
    while e~=2
        e=e+1;
    d(i,e)=input('Please enter the domain of the function in a reapted form: ');
    end
end
p=input('How many of the series do you want?: ');
T=(d(i,e)-d(1,1));
l1=d(1,1);
l2=d(i,e);
i=0;
F=0;
l=T/2;
while i~=a
    i=i+1;
        F=F+(heaviside(x-d(i,1))-heaviside(x-d(i,2)))*f(i,1);
end
A0=1/(2*l)*int(F,l1,l2);
An=(1/l)*int(F*cos((n*pi*x)/l),x,l1,l2);
Bn=(1/l)*int(F*sin((n*pi*x)/l),x,l1,l2);
s=A0+symsum(An*cos((n*pi*x)/l)+Bn*sin((n*pi*x)/l),n,1,o);
subplot(4,1,2)
fplot(s,'r');
title('Fourier Serie ')
subplot(4,1,1)
fplot(F,[l1,l2],'b');
title('Function''s Figure in One Periodic Step ');
subplot(4,1,3)
hold on;
fplot(F,[l1,l2],'b');
fplot(s,[l1,l2],'r');
legend('The Function','The Fourier Serie');
A0=vpa(A0)
An=vpa(An)
Bn=vpa(Bn)
Function=vpa(A0+symsum(An*cos((n*pi*x)/l)+Bn*sin((n*pi*x)/l),n,1,p))