function []=showTrials(signalMatrix,MatrixDenoised,a,t)
close all
figure;
subplot(2,4,1)
plot(t,signalMatrix(a(1),:))
axis tight;
title('SEGNALE I')
xlabel('tempo (sec)')
subplot(2,4,5)
plot(t,MatrixDenoised(a(1),:))
axis tight;
title('FILTRATO I')
xlabel('tempo (sec)')

subplot(2,4,2)
plot(t,signalMatrix(a(2),:))
axis tight;
title('SEGNALE II')
xlabel('tempo (sec)')
subplot(2,4,6)
plot(t,MatrixDenoised(a(2),:))
axis tight;
title('FILTRATO II')
xlabel('tempo (sec)')

subplot(2,4,3)
plot(t,signalMatrix(a(3),:))
axis tight;
title('SEGNALE III')
xlabel('tempo (sec)')
subplot(2,4,7)
plot(t,MatrixDenoised(a(3),:))
axis tight;
title('FILTRATO III')
xlabel('tempo (sec)')

subplot(2,4,4)
plot(t,signalMatrix(a(4),:))
axis tight;
title('SEGNALE IV')
xlabel('tempo (sec)')
subplot(2,4,8)
plot(t,MatrixDenoised(a(4),:))
axis tight;
title('FILTRATO IV')
xlabel('tempo (sec)')

uiwait(msgbox('Questa figura mostra i quattro segnali selezionati precedentemente: nella riga superiore si può vedere come si presentano i segnali, in quella inferiore l''effetto del filtraggio Wavelet ','Wavelet Project','help'))
pause
close all
figure
subplot(1,2,1)
contourf(signalMatrix);
s=size(signalMatrix);
xlabel('Numero di campioni');
ylabel('Numero di Trials');
axis ([0 512 1 s(1,1)]);
colorbar;
title('CONTOUR PLOT TRIALS ORIGINALI','FontWeight','bold')
subplot(1,2,2)
contourf(MatrixDenoised);
xlabel('Numero di campioni');
ylabel('Numero di Trials');
p=size(MatrixDenoised);
axis ([0 512 1 p(1,1)]);
colorbar;
title('CONTOUR PLOT TRIALS FILTRATI','FontWeight','bold')

uiwait(msgbox('In questa figura è possibile visualizzare nella parte sinistra una rappresentazione bidimensionale della matrice dei segnali originali, nella parte destra la matrice dei segnali filtrati. Si possono individuare in entrambi i casi le onde di interesse tramite diverse colorazioni di intensità maggiore.','Wavelet Project','help'))
pause
