clear all;
clc;
% Datos experimentales
p = [0.2312*0	0.4616	0.4664	0.4848	0.5792	0.6568	0.712	0.7856	0.8256	0.8592	0.8848	0.9488	1.1388]
tiempo = [0	15	30	45	60	75	90	105	120	135	150	165	180];
s = tf('s');
T11 = 2;
T12 = 2;
Tretardo1 = 0;

ganancia1 = 0.46 + 0.0015; % valor donde tiende a quedarse el fenomeno 1
G1 = ganancia1/( (T11*s+1)*(T12*s+1) ) * exp(-Tretardo1*s); % T1 cte de tiempo que representa la subida del primer fenomeno, mientras mas chico sube mas rapido
t = 0:0.1:180;
y1 = step(G1,t);


Tret1 = 34; % Retardo que dice cuando empieza el segndo fenomeno


% Sistema que representa el Segundo fenomeno
Tretardo2 = 0; % Este valor dice cuando termina uno y cuando empieza el otro
ganancia2 = .48 -.005;% Con este regulas la pendiente de la recta final
T21 = 30 +.5; % cte de tiempo que le da lo redondeado del segundo fenomeno
T22 =30;
G2 = ganancia2/( (T21*s+1)*(T22*s + 1) ) * exp(- ( Tretardo2 + Tret1 ) * s);
t = 0:0.1:180;
y2 = step(G2,t);


Tret2 = 150; % Retardo que dice cuando empieza el tercer fenomeno


% Sistema que representa el Segundo fenomeno
Tretardo3 = 5; % Este valor dice cuando termina uno y cuando empieza el otro
ganancia3 = 0.55;% Con este regulas la pendiente de la recta final
T31 = 30; % cte de tiempo que le da lo redondeado del segundo fenomeno
T32 =10;
G3 = ganancia3/( (T31*s+1)*(T32*s + 1) ) * exp(- ( Tretardo3 + 1*Tret2 ) * s);
t = 0:0.1:180;
y3 = step(G3,t);



y = y1 .* ( 1 - heaviside(t-Tret1))' + heaviside(t-Tret1)' .* (y2+ y1(10*Tret1)) + heaviside(t-Tret2)' .* (y3+ y2(10*Tret1));


% Modelo Peleg

t_peleg = 0:0.1:180;
P1_peleg = (0 + t ./ (4 + 1/0.52 .* t))';
P2_peleg = (0 + (t - Tret1 - 10) ./ (180 + 1/1.2 .*  ( t - Tret1 - 10)) )' .* heaviside(t - Tret1 - 10)';
P3_peleg = (0 + (t - Tret2) ./ (160 + 1/0.99 .*  ( t - Tret2)) )' .* heaviside(t - Tret2)';

P_peleg = P1_peleg .* ( 1 - heaviside(t_peleg-Tret1))' + heaviside(t_peleg-Tret1)' .* (P2_peleg+ P1_peleg(10*Tret1)) + heaviside(t-Tret2)' .* (P3_peleg+ P2_peleg(10*Tret1));

y = y1 .* ( 1 - heaviside(t-Tret1))' + heaviside(t-Tret1)' .* (y2+ y1(10*Tret1)) + heaviside(t-Tret2)' .* (y3+ y2(10*Tret1));






figure(2);
  clf;
 plot(tiempo,p,'*');
  hold;
  plot(t,y);
 plot(t_peleg,P_peleg,'k'),% plot(t_peleg,PELEGprueba,'g')
 title('70 grados')


% Calculo del Error
posicion = [1 151 301 451 601 751 901 1051 1201 1351 1501 1651 1801];
Error_nuestro = norm(y(posicion) - p',2)
 Error_pelej = norm(P_peleg(posicion) - p',2)
 
 




