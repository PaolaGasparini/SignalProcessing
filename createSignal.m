function [signalMatrix,erpMatrix,t]=createSignal(SNR,range)
% INPUT di funzioni:
% SNR e range di latenza.
% OUTPUT di funzioni:
% "signalMatrix" è matrice di tre segnali artificiali sporcati, con SNR
% e range di latenza scelto dall'utente.
% "erpMatrix" è matrice di tre segnali artificiali puliti, con range di
% latenza.

load('cg_o1t.asc')
EEG1=cg_o1t(512:767,1); 
EEG2=cg_o1t(1024:1279,1);
EEG=[EEG1' EEG2'];
EEG=EEG-mean(EEG);
% l'EEG creato è l'unione di due parti iniziali, prima dei picchi, di due
% segnali del dataset.
signalMatrix=zeros(3,512);
erpMatrix=zeros(3,512);

for i=1:1:3
    latenza1=round(range*rand(1));
    x1=20+latenza1:1:29+latenza1; 
    m1=mean(x1);                        % con latenza
    sigma1=std(x1);
    g1=20*normpdf(x1,m1,sigma1);        % P1 artificiale con latenza
    
    latenza2=latenza1;                  % latenza 2 è la latenza di N2,
                                        % uguale a P1 perchè i picchi son
                                        % consecutivi
    x2=30+latenza2:1:39+latenza2;                         
    m2=mean(x2);                        % con latenza
    sigma2=std(x2);
    g2=-20*normpdf(x2,m2,sigma2);       % N2 artificiale con latenza
    
    latenza3=round(range*rand(1));      % latenza di P3 
    x3=100+latenza3:1:162+latenza3;                         
    m3=mean(x3);                        
    sigma3=std(x3);
    g3=50*normpdf(x3,m3,sigma3);        % P3 artificiale con latenza
    
    y(i,:)=[zeros(1,275+latenza1) g1 g2 zeros(1,59-latenza1+latenza3) g3 zeros(1,95-latenza3)];
    %  y è il segnale artificiale pulito creato
  
    y(i,:)=24*SNR*y(i,:);
    signalMatrix(i,:)=y(i,:)+EEG;
    %  signalMatrix è il segnale artificiale sporcato con EEG.   
    erpMatrix(i,:)=y(i,:);
    %  erpMatrix è il segnale artificiale pulito.   
    
end
fs=250;
n=512;
t=-1:1/fs:n/fs-1/fs-1;
figure
subplot(3,1,1)
plot(t,y(1,:))
title('PRIMO ERP','FontWeight','bold')
xlabel('tempo (sec)')
axis tight

subplot(3,1,2)
plot(t,y(2,:))
title('SECONDO ERP','FontWeight','bold')
xlabel('tempo (sec)')
axis tight

subplot(3,1,3)
plot(t,y(3,:))
title('TERZO ERP','FontWeight','bold')
xlabel('tempo (sec)')
axis tight

uiwait(msgbox('Sono qui mostrati tre segnali: se avete scelto di inserire la latenza, i picchi saranno posti casualmente entro certi intervalli temporali predefiniti','Wavelet Project','help'))
pause
close all

figure
subplot(3,1,1)
plot(t,signalMatrix(1,:))
title('ERP1 + EEG con SNR dato in ingresso','FontWeight','bold')
xlabel('tempo (sec)')
axis tight

subplot(3,1,2)
plot(t,signalMatrix(2,:))
title('ERP2 + EEG con SNR dato in ingresso','FontWeight','bold')
xlabel('tempo (sec)')
axis tight

subplot(3,1,3)
plot(t,signalMatrix(3,:))
title('ERP3 + EEG con SNR dato in ingresso','FontWeight','bold')
xlabel('tempo (sec)')
axis tight

stdEEG=std(EEG(1,:))  ;
%è specificato nell'articolo che usano la std della seconda parte
%dell'EEG, in particolare nell'intervallo dell'ERP
stdY=std(y(1,:));
SNRmisurato=stdY/stdEEG;
% errSNR=abs(SNR-SNRmisurato)/SNR;

uiwait(msgbox('In questa figura sono rappresentati i segnali precedentemente realizzati, con sovrapposto un segnale EEG, mantenendo il SNR selezionato. Questo è il segnale su cui applicheremo il nostro filtraggio Wavelet','Wavelet Project','help'))
pause

