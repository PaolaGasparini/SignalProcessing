function [trialsMatrix]=createTrials(m) 
% INPUT:
% dataset di origine.
% OUTPUT:
% dataset opportunamente separato in trials.
% es. m=cg_o1t.asc - 30 trials
y1=load(m);
%eliminiamo l'ultimo campione che era posto a 0. 
y1(end)=[];
n=length(y1)/512;
%  Procediamo ora per separare i  trials.
trialsMatrix=zeros(n,512);
trialsMatrix(1,:)=y1(1:512,1);
for i=1:1:n-1
    trialsMatrix(i+1,:)=y1(((512*i)+1:512*(i+1)),1);
end
