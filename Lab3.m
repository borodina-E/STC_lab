%Формирование дискретного сигнала
T1 = 0.1;
T2 = 0.18;
U1 = 2; 
U2 = 4; 
U3 = 6;
U4 = 8;
Fd = 200;
T = 1/Fd;
x = 0:T:T2;
u1 = 20*x(1:T1*Fd-1)+2;
u2 = 25*x(T1*Fd:end)+3.5;
U = [u1 u2];
figure(1);
stem(U);
title('Исходный дискретный сигнал');
xlabel('t, с');
ylabel('S(t), B');

%Расчет ДПФ
dpf = fft(U);
figure(2);
subplot(2,1,1);
stem(abs(dpf))
title('Модуль спектральных отсчетов');
ylabel('|U(f)|, B');
subplot(2,1,2);
stem(angle(dpf));
ylabel('arg[U(f)], рад');
title('Фазы спектральных отсчтетов');

%Оценка ширины спектра сигнала
E0 = 0;
for k = 1:length(U)
    E0 = E0 + abs((U(k))^2);
end
dpfcopy = dpf;
Nmax = 2;
for k = 1:length(dpfcopy)
   if (k > Nmax)&&(k < length(dpfcopy) - Nmax + 2)
     dpfcopy(k) = 0;
   end    
end
idpf = ifft(dpfcopy);
E1 = 0;
for k = 1:length(idpf)
    E1 = E1 + abs((idpf(k))^2);
end
figure(3);
stem(U);
title('Исходный сигнал и сигнал после БПФ');
xlabel('t, с');
ylabel('S(t), B');
hold on
stem(idpf);
xlabel('t, с');
ylabel('S(t), B');

%Дополнение сигнала нулями
Ucopy = U;
U0 = [U, zeros(1,length(Ucopy))];
newdpf = fft(U0);
figure(4);
subplot(2,1,1);
stem(abs(newdpf))
title('Модуль спектральных отсчетов сигнала дополненного нулями');
ylabel('|U(f)|, B');
subplot(2,1,2);
stem(angle(newdpf));
ylabel('arg[U(f)], рад');
title('Фазы спектральных отсчтетов сигнала дополненного нулями');

%Измерение скорости расчетов при вычислении ДПФ непосредственно по
%теоретической формуле
disp("ДПФ непосредственно по теоретической формуле")

N = 1024 
U1 = [U zeros(1, N-length(U))];
D = dftmtx(N);
y = zeros(1, N);
tic
for k = 1:900
    y = U1*D;
end
toc
% N = 64 t = 0.004877; 
% N = 128 t = 0.015684; 
% N = 256 t = 0.038780; 
% N = 512 t = 0.212827; 
% N = 1024 t = 0.971703; 
% N = 2048 t = 4.252878; 
% N = 4096 t = 15.207017; 
% N = 8192 t = 61.653183

%Измерение скорости расчетов при вычислении ДПФ с использованием быстрого
%алгоритма
disp("ДПФ с использованием быстрого алгоритма")
N = 1024
y = zeros(1, N);
tic 
for k = 1:11000 
y = fft(U, N); 
end
toc
% N = 64 t = 0.048296
% N = 128 t = 0.032489
% N = 256 t = 0.044898
% N = 512 t = 0.060271
% N = 1024 t = 0.120969
% N = 2048 t = 0.163680
% N = 4096 t = 0.336324
% N = 8192 t = 0.609600
