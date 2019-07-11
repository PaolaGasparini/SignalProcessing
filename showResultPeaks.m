function showResultPeaks(signalMatrix,signalMatrixDenoised,erpMatrix)

close all


errSP1= sqrt(sum((signalMatrix(1,279:288)-erpMatrix(1,279:288)).^2)/(length(signalMatrix)));

errSN2= sqrt(sum((signalMatrix(1,286:296)-erpMatrix(1,286:296)).^2)/(length(signalMatrix)));

errSP3= sqrt(sum((signalMatrix(1,358:422)-erpMatrix(1,358:422)).^2)/(length(signalMatrix)));
%abbiamo calcolato l'errore di signalMatrix (ERP+EEG) con l'ERP pulito sui tre
%picchi.

errWTP1= sqrt(sum((signalMatrixDenoised(1,279:288)-erpMatrix(1,279:288)).^2)/(length(signalMatrixDenoised)));

errWTN2= sqrt(sum((signalMatrixDenoised(1,286:296)-erpMatrix(1,286:296)).^2)/(length(signalMatrixDenoised)));

errWTP3= sqrt(sum((signalMatrixDenoised(1,358:422)-erpMatrix(1,358:422)).^2)/(length(signalMatrixDenoised)));
%abbiamo calcolato l'errore di signalMatrixDenoised (filtrato con le Wavelet) con
%l'ERP pulito sui tre picchi.

subplot(1,3,1)
figure(1)
bar(1,errSP1)
hold on
bar(2,errWTP1,'r')
title('ONDA P1','FontWeight','bold')
axis([0 4 0 4])

subplot(1,3,2)
bar(1,errSN2)
hold on
bar(2,errWTN2,'r')
title('ONDA N2','FontWeight','bold')
axis([0 4 0 4])


subplot(1,3,3)
bar(1,errSP3)
hold on
bar(2,errWTP3,'r')
title('ONDA P3','FontWeight','bold')
axis([0 4 0 4])

legend('RMS error del segnale originale', 'RMS error del segnale filtrato con le WT')

uiwait(msgbox('Infine mostriamo l''errore riferito ad ogni singola onda d''interesse relativa al segnale ERP','Wavelet Project','help'))
pause



