
function [MatrixDenoised] = filteringWT(signalMatrix)
% INPUT di funzione:
% "signalMatrix" è la matrice di tre segnali da filtrare.
% OUTPUT di funzione:
% MatrixDenoised è la matrice di tre segnali filtrati attraverso le wavelet.

close all

l=size(signalMatrix);
MatrixDenoised=zeros(l(1,1),l(1,2));                
% inizializzazione della matrice in cui metteremo i segnali filtrati

for i=1:1:l(1,1)
    y=signalMatrix(i,:);
    n=length(y);

    [C,L]=wavedec(y,5,'bior3.3');
    %  funzione del toolbox di Matlab che scompone il segnale in cinque
    %  livelli usando le wavelet biortogonali, utilizzate anche 
    %  dall'articolo.
    
    cA5=appcoef(C,L,'bior3.3',5);
    %  funzione del toolbox di Matlab che fornisce i coefficienti
    %  dell'approssimazione 5 che è la prima.

    [cD1 cD2 cD3 cD4 cD5]=detcoef(C,L,[1,2,3,4,5]);
    %  funzione del toolbox di Matlab che fornisce i coefficienti
    %  di tutti i dettagli

    A5=wrcoef('a',C,L,'bior3.3',5); 
    %  funzione del toolbox di Matlab che ricostruisce il segnale
    %  dell'approssimazione 5 a partire dai coefficienti.
  

    %seleziono i coef prima calcolati - questa selezione opera da
    %filtraggio
    cA5selected=zeros(1,L(1));
    % L(1) rappresenta il numero di coefficienti per A5, 
    % lo stesso discorso viene fatto per tutti gli altri.   
    cD5selected=zeros(1,L(2)); 
    cD4selected=zeros(1,L(3));
    cD3selected=zeros(1,L(4));
    cD2selected=zeros(1,L(5));
    cD1selected=zeros(1,L(6));
    clc
    a5=(280/512)*L(1);
    % a5 rappresenta il coefficiente su L(1) che corrisponde nel tempo del
    % segnale l'inizio del primo picco (che avviene dopo 280 campioni
    % circa).
    b5=(440/512)*L(1);
    % b5 rappresenta il coefficiente su L(1) che corrisponde nel tempo del
    % segnale alla fine dei picchi (che avviene dopo 440 campioni
    % circa).
    a4=(280/512)*L(3);
    % stesso discorso di a5   
    b4=(440/512)*L(3);
    % stesso discorso di b5  
    a3=(280/512)*L(4);
    %  stesso discorso di a4 e a5   
    b3=(320/512)*L(4);
    % b3 rappresenta il coefficiente su L(4) che corrisponde nel tempo del
    % segnale alla fine dei picchi P1 e N2 (che avviene dopo 330 campioni
    % circa). Facciamo questo perchè vogliamo, come fatto nell'articolo, considerare solo le
    % componenti veloci del segnale.
    clc
    cA5selected(1,a5:b5)=cA5(1,a5:b5);
    cD5selected(1,a5:b5)=cD5(1,a5:b5);
    cD4selected(1,a4:b4)=cD4(1,a4:b4);
    cD3selected(1,a3:b3)=cD3(1,a3:b3);      
    clc
    % questi li commentiamo perchè così ignoriamo i dettagli dei primi due
    % livelli, ottenendo un effetto di filtraggio (voluto, come
    % nell'articolo)
    % cD2selected(1,64:112)=cD2(1,64:112);
    % cD1selected(1,128:224)=cD1(1,128:224);

    Cnew=[cA5selected cD5selected cD4selected cD3selected cD2selected cD1selected];     
    % Cnew sono i coef selezionati per la ricostruzione del segnale

    MatrixDenoised(i,:)=waverec(Cnew,L,'bior3.3');
    % ricostruisce la matrice dei segnali puliti a partire dai coefficienti
    % selezionati.
    
end


subplot(3,1,1)
n1=L(6);
Ttot=512/250;
fs1=n1/Ttot;
t=-1:1/fs1:Ttot-1/fs1-1;
stem(t,cD1,'r')
hold on
stem(t,cD1selected,'filled')
title('COEFFICIENTI DETTAGLIO 1 (D1)','FontWeight','bold')
xlabel('tempo (sec)')
axis tight;


subplot(3,1,2)
n1=L(5);
fs1=n1/Ttot;
t=-1:1/fs1:Ttot-1/fs1-1;
stem(t,cD2,'r')
hold on
stem(t,cD2selected,'filled')
title('COEFFICIENTI DETTAGLIO 2 (D2)','FontWeight','bold')
xlabel('tempo (sec)')
axis tight;

subplot(3,1,3)
n1=L(4);
fs1=n1/Ttot;
t=-1:1/fs1:Ttot-1/fs1-1;
stem(t,cD3,'r')
hold on
stem(t,cD3selected,'filled')
title('COEFFICIENTI DETTAGLIO 3 (D3)','FontWeight','bold')
axis tight;
xlabel('tempo (sec)')
legend('coeff.','coeff. scelti')
uiwait(msgbox('Per operare il filtraggio è necessario selezionare i coefficienti opportuni. In questa figura quindi vengono mostrati i coefficienti scelti (blu) e quelli non scelti (rossi) relativamente ai dettagli: D1, D2 e D3'))
pause
close


subplot(3,1,1)
n1=L(3);
fs1=n1/Ttot;
t=-1:1/fs1:Ttot-1/fs1-1;
stem(t,cD4,'r')
hold on
stem(t,cD4selected,'filled')
title('COEFFICIENTI DETTAGLIO 4 (D4)','FontWeight','bold')
axis tight;
xlabel('tempo (sec)')


subplot(3,1,2)
n1=L(2);
fs1=n1/Ttot;
t=-1:1/fs1:Ttot-1/fs1-1;
stem(t,cD5,'r')
hold on
stem(t,cD5selected,'filled')
title('COEFFICIENTI DETTAGLIO 5 (D5)','FontWeight','bold')
axis tight;
xlabel('tempo (sec)')


subplot(3,1,3)
n1=L(1);
fs1=n1/Ttot;
t=-1:1/fs1:Ttot-1/fs1-1;
stem(t,cA5,'r')
hold on
stem(t,cA5selected,'filled')
title('COEFFICIENTI APPROSSIMAZIONE 5 (A5)','FontWeight','bold')
axis tight;
xlabel('tempo (sec)')
legend('coeff.','coeff. scelti')
uiwait(msgbox('Questi invece sono i coefficienti relativi ai dettagli D4, D5 e all''approssimazione A5'))
pause




    