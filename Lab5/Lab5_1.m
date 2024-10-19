%исследование свойств шума квантования
k = 0:10^5-1;
x = 5*cos(3*k+0.5);

%шаг квантования = 1/256

x_q256 = round(x*256)/256;
Noise256 = x_q256 - x;
figure(1)
subplot(2,2,1);
plot(Noise256(1:200));
title('Шум квантования');
xlabel('Отсчеты');
ylabel('U,В');
nbin = 100;
subplot(2,2,2);
histogram(Noise256, nbin);
title('Гистограмма');
kmax = 100;
subplot(2,2,3);
[Rx, dk] = xcorr(Noise256, kmax, 'unbiased');
plot(dk,Rx);
title('Корреляционная функция');
xlabel('Отсчеты');
ylabel('U,В');
Lb = 256;
subplot(2,2,4);
pwelch(Noise256, Lb);


%шаг квантования = 1/16

x_q16 = round(x*16)/16;
Noise16 = x_q16 - x;
figure(2)
subplot(2,2,1);
plot(Noise16(1:200));
title('Шум квантования');
xlabel('Отсчеты');
ylabel('U,В');
nbin = 100;
subplot(2,2,2);
histogram(Noise16, nbin);
title('Гистограмма');
kmax = 100;
subplot(2,2,3);
[Rx, dk] = xcorr(Noise16, kmax, 'unbiased');
plot(dk,Rx);
title('Корреляционная функция');
xlabel('Отсчеты');
ylabel('U,В');
Lb = 256;
subplot(2,2,4);
pwelch(Noise16, Lb);


%шаг квантования = 1

x_q1 = round(x);
Noise1 = x_q1 - x;
figure(3)
subplot(2,2,1);
plot(Noise1(1:200));
title('Шум квантования');
xlabel('Отсчеты');
ylabel('U,В');
nbin = 100;
subplot(2,2,2);
histogram(Noise1, nbin);
title('Гистограмма');
kmax = 100;
subplot(2,2,3);
[Rx, dk] = xcorr(Noise1, kmax, 'unbiased');
plot(dk,Rx);
title('Корреляционная функция');
xlabel('Отсчеты');
ylabel('U,В');
Lb = 256;
subplot(2,2,4);
pwelch(Noise1, Lb);


%БГШ c шагом квантования 1/256
sn = randn(1, 10^5);
sn = sn/max(abs(sn));
sn_qG = round(sn*256)/256;
NoiseG = sn_qG - sn;
figure(4)
subplot(2,2,1);
plot(NoiseG(1:200));
title('Шум квантования');
xlabel('Отсчеты');
ylabel('U,В');
nbin = 100;
subplot(2,2,2);
histogram(NoiseG, nbin);
title('Гистограмма');
kmax = 100;
subplot(2,2,3);
[Rx, dk] = xcorr(NoiseG, kmax, 'unbiased');
plot(dk,Rx);
title('Корреляционная функция');
xlabel('Отсчеты');
ylabel('U,В');
Lb = 256;
subplot(2,2,4);
pwelch(NoiseG, Lb);

%речевой сигнал
load mtlb
Speach = mtlb/max(abs(mtlb));
sn_qS = round(Speach*256)/256;
NoiseS = sn_qS - Speach;
figure(5)
subplot(2,2,1);
plot(NoiseS(1:200));
title('Шум квантования');
xlabel('Отсчеты');
ylabel('U,В');
nbin = 100;
subplot(2,2,2);
histogram(NoiseS, nbin);
title('Гистограмма');
kmax = 100;
subplot(2,2,3);
[Rx, dk] = xcorr(NoiseS, kmax, 'unbiased');
plot(dk,Rx);
title('Корреляционная функция');
xlabel('Отсчеты');
ylabel('U,В');
Lb = 256;
subplot(2,2,4);
pwelch(NoiseS, Lb);
