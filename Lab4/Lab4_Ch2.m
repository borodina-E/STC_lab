%Фильтр Чебышева 2-го рода

function Chebyshev2 = Lab4_Ch2
%LAB4_CH2 Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 24.2 and Signal Processing Toolbox 24.2.
% Generated on: 17-Oct-2024 19:32:47

% Chebyshev Type II Lowpass filter designed using FDESIGN.LOWPASS.

% All frequency values are in Hz.
Fs = 10000;  % Sampling Frequency

Fpass = 2000;        % Passband Frequency
Fstop = 3000;        % Stopband Frequency
Apass = 0.5;         % Passband Ripple (dB)
Astop = 50;          % Stopband Attenuation (dB)
match = 'stopband';  % Band to match exactly

% Construct an FDESIGN object and call its CHEBY2 method.
h  = fdesign.lowpass(Fpass, Fstop, Apass, Astop, Fs);
Chebyshev2 = design(h, 'cheby2', 'MatchExactly', match);

% [EOF]

figure(1)
impz(Chebyshev2)
figure(2)
freqz(Chebyshev2)
figure(3)
grpdelay(Chebyshev2)
figure(4)
zplane(Chebyshev2)

% Реальная Fpass = 2.005615 kHz Fstop = 0.504907 kHz
% Минимальная величина задержки 1.81656, максимальная - 5.700085
% Порядок фильтра 6
