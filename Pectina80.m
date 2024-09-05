clear all;
clc;
% Datos experimentales
p = [0 5.96 6.128	6.53	8.83	10.232	11.224	11.704	11.97	11.98	12.20	13.88	16.78]
tiempo = [0	15	30	45	60	75	90	105	120	135	150	165	180]

% Sistema que representa el primer salto
s = tf('s');

T11 = 2;
T12 = 2.1;
Tretardo1 = 0.35;

ganancia1 = 6.1; % valor donde tiende a quedarse el fenomeno 1
G1 = ganancia1/( (T11*s+1)*(T12*s+1) ) * exp(-Tretardo1*s); % T1 cte de tiempo que representa la subida del primer fenomeno, mientras mas chico sube mas rapido
t = 0:0.1:180;
y1 = step(G1,t);


Tret1 = 35.8; % Retardo que dice cuando empieza el segndo fenomeno


% Sistema que representa el Segundo fenomeno
Tretardo2 = 5; % Este valor dice cuando termina uno y cuando empieza el otro
ganancia2 = 5.95;% Con este regulas la pendiente de la recta final
T21 = 7; % cte de tiempo que le da lo redondeado del segundo fenomeno
T22 = 21;
G2 = ganancia2/( (T21*s+1)*(T22*s + 1) ) * exp(- ( Tretardo2 + Tret1 ) * s);
t = 0:0.1:180;
y2 = step(G2,t);


Tret2 = 140; % Retardo que dice cuando empieza el tercer fenomeno


% Sistema que representa el Tercer fenomeno
Tretardo3 = 4.9; % Este valor dice cuando termina uno y cuando empieza el otro
ganancia3 = 52;% Con este regulas la pendiente de la recta final
T31 = 60; % cte de tiempo que le da lo redondeado del segundo fenomeno
T32 = 82;
G3 = ganancia3/( (T31*s+1)*(T32*s + 1) ) * exp(- ( Tretardo3 + Tret2 ) * s);
t = 0:0.1:180;
y3 = step(G3,t);



y = y1 .* ( 1 - heaviside(t-Tret1))' + heaviside(t-Tret1)' .* (y2+ y1(10*Tret1)) + heaviside(t-Tret2)' .* (y3+ y2(10*Tret1));




% Modelo Peleg

 t_peleg = 0:0.1:180;

P1_peleg = (0 + t ./ (0.999 + 4/30 .* t))';

P2_peleg = (0 + (t - Tret1 - 11) ./ (4.2 + 1/8 .*  ( t - Tret1 - 11)) )' .* heaviside(t - Tret1 -11)';

P3_peleg = (0 + (t - Tret2) ./ (70 + 6.5/15.1 .*  ( t - Tret2)) )' .* heaviside(t - Tret2)';;

 P_peleg = P1_peleg .* ( 1 - heaviside(t_peleg-Tret1))' + heaviside(t_peleg-Tret1)' .* (P2_peleg+ P1_peleg(10*Tret1)) + heaviside(t-Tret2)' .* (P3_peleg+ P2_peleg(10*Tret1));

 y = y1 .* ( 1 - heaviside(t-Tret1))' + heaviside(t-Tret1)' .* (y2+ y1(10*Tret1)) + heaviside(t-Tret2)' .* (y3+ y2(10*Tret1));

% Calculo del Error
 posicion = [1 151 301 451 601 751 901 1051 1201 1351 1501 1651 1801];

 Error_nuestro = norm(y(posicion) - p',2)
 Error_pelej = norm(P_peleg(posicion) - p',2)

figure(1);
clf;
plot(tiempo,p,'*');
hold;
plot(t,y);
 plot(t_peleg,P_peleg,'k'),
 title('80 grados')




