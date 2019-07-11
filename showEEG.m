function []=showEEG(eegMatrix,eegMatrixDenoised,t)
close all
figure;
subplot(2,3,1)
plot(t,eegMatrix(1,:))
axis tight;
title('EEG I','FontWeight','bold')
xlabel('tempo (sec)')
subplot(2,3,4)
plot(t,eegMatrixDenoised(1,:))
axis tight;
title('EEG FILTRATO I','FontWeight','bold')
xlabel('tempo (sec)')

subplot(2,3,2)
plot(t,eegMatrix(2,:))
axis tight;
title('EEG II','FontWeight','bold')
xlabel('tempo (sec)')
subplot(2,3,5)
plot(t,eegMatrixDenoised(2,:))
axis tight;
title('EEG FILTRATO II','FontWeight','bold')
xlabel('tempo (sec)')

subplot(2,3,3)
plot(t,eegMatrix(3,:))
axis tight;
title('EEG III','FontWeight','bold')
xlabel('tempo (sec)')
subplot(2,3,6)
plot(t,eegMatrixDenoised(3,:))
axis tight;
title('EEG FILTRATO III','FontWeight','bold')
xlabel('tempo (sec)')

uiwait(msgbox('In questa figura sono mostrati tre segnali EEG, e l''effetto del filtraggio a loro applicato. Come si può notare non emerge, come auspicato, nessun pattern introdotto dal filtraggio','Wavelet Project','help'))
pause