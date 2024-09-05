clear all;
close all;
clc;
% Datos experimentales
  p = [0	3.94	10.02	14.82	17.47	18.76	19.58	19.91	25.96	29.92	30.94 31.97	33.24] 


tiempo = [0 16 33 50 67 83 100 116 132 148 154 165 180]

% Sistema que representa el primer salto
s = tf('s');

T11 = 18;
T12 = 20;
Tretardo1 = 1;

ganancia1 = 20.2; % valor donde tiende a quedarse el fenomeno 1
G1 = ganancia1/( (T11*s+1)*(T12*s+1) ) * exp(-Tretardo1*s); % T1 cte de tiempo que representa la subida del primer fenomeno, mientras mas chico sube mas rapido
t = 0:0.1:180;
y1 = step(G1,t);


Tret1 = 115; % Retardo que dice cuando empieza el segndo fenomeno


% Sistema que representa el Segundo fenomeno
Tretardo2 = 3; % Este valor dice cuando termina uno y cuando empieza el otro
ganancia2 =11% Con este regulas la pendiente de la recta final
T21 =10; % cte de tiempo que le da lo redondeado del segundo fenomeno
T22 = 5;
G2 = ganancia2/( (T21*s+1)*(T22*s + 1 * 1) ) * exp(- ( Tretardo2 + Tret1 ) * s);
t = 0:0.1:180;
y2 = step(G2,t);


Tret2 = 140; % Retardo que dice cuando empieza el tercer fenomeno


% Sistema que representa el tercer fenomeno
Tretardo3 =0.96; % Este valor dice cuando termina uno y cuando empieza el otro
ganancia3 = 3.9;% Con este regulas la pendiente de la recta final
T31 = 14; % cte de tiempo que le da lo redondeado del segundo fenomeno
T32 =25;
G3 = ganancia3/( (T31*s+1)*(T32*s + 1) ) * exp(- ( Tretardo3 + Tret2 ) * s);
t = 0:0.1:180;
y3 = step(G3,t);



y = y1 .* ( 1 - heaviside(t-Tret1))' + heaviside(t-Tret1)' .* (y2+ y1(10*Tret1)) + heaviside(t-Tret2)' .* (y3+ y2(10*Tret1));


% Modelo Peleg

t_peleg = 0:0.1:180;

P1_peleg = (0 + t ./ (1.8 + 1/30 .* t))';


P2_peleg = (0 + (t - Tret1 - 9) ./ (1.50 + 1/20 .*  ( t - Tret1 - 9)) )' .* heaviside(t - Tret1 -9)';

P3_peleg = (0 + (t - Tret2) ./ (160 + 1/0.99 .*  ( t - Tret2)) )' .* heaviside(t - Tret2)';;

P_peleg = P1_peleg .* ( 1 - heaviside(t_peleg-Tret1))' + heaviside(t_peleg-Tret1)' .* (P2_peleg+ P1_peleg(10*Tret1)) + heaviside(t-Tret2)' .* (P3_peleg+ P2_peleg(10*Tret1));

y = y1 .* ( 1 - heaviside(t-Tret1))' + heaviside(t-Tret1)' .* (y2+ y1(10*Tret1)) + heaviside(t-Tret2)' .* (y3+ y2(10*Tret1));


% Calculo del Error
posicion = [1 161 331 501 671 831 1001 1161 1321 1481 1541 1651 1801];                     
Error_nuestro = norm(y(posicion)- p',2)
 Error_pelej = norm(P_peleg(posicion) - p',2)


figure(3);
clf;
plot(tiempo,p,'*');
hold;
plot(t,y);
plot(t_peleg,P_peleg,'k'),
 title('90 grados')







