function []=showSignal(signalMatrix,MatrixDenoised,t)
% INPUT:
% signalMatrix:  segnali artificiali sporcati
% MatrixDenoised: relativi segnali artificiali puliti attraverso le wavelet.
% t=tempo un secondo prima dell'inizio dei picchi ed un secondo dopo (da -1
% a 1sec).

close all
figure;
subplot(2,3,1)
plot(t,signalMatrix(1,:))
axis tight;
title('SEGNALE I','FontWeight','bold')
xlabel('tempo (sec)')
subplot(2,3,4)
plot(t,MatrixDenoised(1,:))
axis tight;
title('SEGNALE FILTRATO I','FontWeight','bold')
xlabel('tempo (sec)')

subplot(2,3,2)
plot(t,signalMatrix(2,:))
axis tight;
title('SEGNALE II','FontWeight','bold')
xlabel('tempo (sec)')
subplot(2,3,5)
plot(t,MatrixDenoised(2,:))
axis tight;
title('SEGNALE FILTRATO II','FontWeight','bold')
xlabel('tempo (sec)')

subplot(2,3,3)
plot(t,signalMatrix(3,:))
axis tight;
title('SEGNALE III','FontWeight','bold')
xlabel('tempo (sec)')
subplot(2,3,6)
plot(t,MatrixDenoised(3,:))
axis tight;
title('SEGNALE FILTRATO III','FontWeight','bold')
xlabel('tempo (sec)')

uiwait(msgbox('Ecco il nostro filtro all''opera: possiamo vedere i tre segnali considerati precedentemente nella riga superiore, mentre in quella inferiore è riportato il rispettivo segnale filtrato tramite la decomposizione Wavelet','Wavelet Project','help'))
pause