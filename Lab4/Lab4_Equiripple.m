%Синтез по минимаксному критерию (метод Ремеза)

function Equiripple = Lab4_Equiripple
%LAB4_EQUIRIPPLE Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 24.2 and Signal Processing Toolbox 24.2.
% Generated on: 17-Oct-2024 20:06:27

% Equiripple Lowpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 10000;  % Sampling Frequency

Fpass = 2000;             % Passband Frequency
Fstop = 3000;             % Stopband Frequency
Dpass = 0.028774368332;   % Passband Ripple
Dstop = 0.0031622776602;  % Stopband Attenuation
dens  = 20;               % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Equiripple = dfilt.dffir(b);

% [EOF]

figure(1)
freqz(Equiripple)
%Kpmin = -0.4018794 и Kpmax = 0.3944785 в полосе пропускания
%Ksmax = -45.96808 в полосе задерживания
%Порядок фильтра 18

%Найденное значение Wstop = 18