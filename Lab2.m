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
stem(U)
title('Входной дискретный сигнал');
xlabel('t, с');
ylabel('S(t), B');

%Пропускание сигнала через дискретный фильтр
x0 = [x, zeros(1,length(x))];
b = [1 0.2 5 1 0.4];
a = [1 -0.2 -0.05 -0.03 0.1];
y = filter(b, a, x0);
figure(2);
stem(y)
title('Выходной сигнал. Прямая реализация фильтра');
xlabel('t, с');
ylabel('S(t), B');

%Анализ прямой формы реализации дискретного фильтра
xmod = abs(x);
ymod = abs(y);
xmax = max(xmod);
ymax = max(ymod);
max_x_y_pryam = max(xmax, ymax)

%Анализ канонической формы реализации дискретного фильтра
b = [1 0 0 0 0];
y = filter(b, a, x0);
figure(3);
stem(y)
title('Выходной сигнал. Каноническая реализация фильтра');
xlabel('t, с');
ylabel('S(t), B');
xmod = abs(x);
ymod = abs(y);
xmax = max(xmod);
ymax = max(ymod);
max_x_y_kanon = max(xmax, ymax)

%Анализ транспонированной формы реализации дискретного фильтра
states = []; 
s = [];
for k = 1:length(x)
[y(k), s] = filter(b, a, x(k), s);
states = [states s];
end
figure(4);
plot(states')
legend('Выходной сигнал. Внутренние сигналы транспонированной реализации');
xlabel('Отсчеты');
ylabel('U,В');
states_max = max(abs(states(:)));

%Получение графиков характеристик фильтра 
b = [1 0.2 5 1 0.4]; 
%fvtool(b, a) 
 
%Получение аналитичской формулы для импульсной характеристики фильтра 
[r, p, k] = residuez(b, a); 
r_abs = abs(r) 
r_phase = angle(r) 
p_abs = abs(p) 
p_phase = angle(p)


