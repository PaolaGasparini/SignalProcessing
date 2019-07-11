function [SNR,range]=interface1()
close all
SNR=menu('Selezionare l''SNR che si desidera utilizzare per il segnale simulato:','0,5','1','2','3');
if(SNR==1) 
    SNR=0.5;
end
if(SNR==2) 
    SNR=1;
end
if(SNR==3) 
    SNR=2;
end
if(SNR==4) 
    SNR=3;
end

latenza=menu('Selezionare ora se si vuole avere un range di latenza nei tre picchi (relativi all''ERP) del segnale simulato:','Senza Latenze','Con Latenza');
if(latenza==1) 
    range=0;
end
if(latenza==2) 
    range=35;
end
