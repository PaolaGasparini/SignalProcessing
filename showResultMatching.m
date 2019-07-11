function showResultMatching(signalMatrix,signalMatrixDenoised,erpMatrix)
close all


errS= sqrt(sum((signalMatrix(1,280:440)-erpMatrix(1,280:440)).^2)/(length(signalMatrix)));
%calcoliamo l'errore di un segnale di signalMatrix (ERP+EEG) con l'ERP
%pulito


errWT= sqrt(sum((signalMatrixDenoised(1,280:440)-erpMatrix(1,280:440)).^2)/(length(signalMatrixDenoised)));
%calcoliamo l'errore di signalMatrixDenoised (filtrato con le Wavelet) con
%l'ERP pulito


figure(1)
bar(1,errS)
hold on
bar(2,errWT,'r')
axis([0 3 0 max(errS)+3])  

title('RMS DEGLI ERRORI','FontWeight','bold')
legend('RMS error del segnale originale', 'RMS error del segnale filtrato con le WT')

uiwait(msgbox('Viene infine mostrato l''errore in termini di RMS, da una parte l''errore sul segnale originale, dall''altra quello filtrato con le Wavelet.','Wavelet Project','help'))
pause