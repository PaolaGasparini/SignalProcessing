function [eegMatrix]=createEEG()
% OUTPUT:
% eegmatrix è la matrice di tre segnali EEG, presi da trials nella parte
% prima dei picchi.
eegMatrix=zeros(3,512);

load('cg_o1t.asc')
EEG1=cg_o1t(1:256,1); 
EEG2=cg_o1t(513:768,1); 
EEG=[EEG1' EEG2'];
EEG=EEG-mean(EEG);
eegMatrix(1,:)=EEG;

EEG1=cg_o1t(1025:1280,1); 
EEG2=cg_o1t(1537:1792,1); 
EEG=[EEG1' EEG2'];
EEG=EEG-mean(EEG);
eegMatrix(2,:)=EEG;

EEG1=cg_o1t(2049:2304,1); 
EEG2=cg_o1t(2561:2816,1); 
EEG=[EEG1' EEG2'];
EEG=EEG-mean(EEG);
eegMatrix(3,:)=EEG;