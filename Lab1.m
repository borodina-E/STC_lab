
%Формирование дискретного сигнала
T1 = 0.1;
T2 = 0.18;
U1 = 2; 
U2 = 4; 
U3 = 6;
U4 = 8;
Fd = 1000;
T = 1/Fd;
x = 0:T:T2;
u1 = 20*x(1:T1*Fd-1)+2;
u2 = 25*x(T1*Fd:end)+3.5;
U = [u1 u2];
figure(1);
plot(x,U)
title('Аналоговый сигнал');
xlabel('t, с');
ylabel('S(t), B');
figure(2);
stem(x,U)
title('Дискретный сигнал');
xlabel('t, с');
ylabel('S(t), B');

%Построение графика спектра дискретного сигнала
N = length(x);
k = (0:N-1).';
w = -pi:0.01:pi;
ExpInd = k*w*(-1i);
MExp = exp(ExpInd);
S = x*MExp; %спектр
f = Fd*w/2*pi;
figure(3);
subplot(2,1,1);
plot(f,abs(S))
title('Амплитудный спектр');
xlabel('f, Гц');
ylabel('|A(f)|, B');
subplot(2,1,2);
plot(f,angle(S))
xlabel('f, Гц');
ylabel('arg[A(f)], рад');
title('Фазовый спектр');


%Восстановление аналогового сигнала по теореме Котельникова
t = -5*T:T/10:T2+5*T;
F = zeros(1,length(t));
for k = 1:length(x)
   F = F + U(k).*sinc((t-k*T)/T); %sinc((t-k*T)/T)
end
figure(4);
stem(x,U)
title('Сигналы дискретный и восстановленный');
xlabel('kt, с');
ylabel('S(kt), B');
hold on;
plot(t,F, 'r')




