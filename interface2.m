function [a,file]=interface2()
close all
temp=menu('Selezionare ora il dataset da cui estrarre i segnali reali, a cui verrà applicata la decomposizione e quindi il filtraggio Wavelet:','cg_o1t.asc','ja_o1t.asc');
if(temp==1) 
    file='cg_o1t.asc';
end
if(temp==2) 
    file='ja_o1t.asc';
end

temp2=menu('E'' possibile visualizzare in seguito solo quattro segnali dal dataset reale. Selezionare la propria preferenza:','I primi quattro','Gli ultimi quattro','Quattro segnali estratti casualmente');
if(temp2==1) 
    a=[1 2 3 4];
end
if(temp2==2) 
    if(temp==1)
        a=[27 28 29 30];
    end    
    if(temp==2)
        a=[13 14 15 16];
    end
end
if(temp2==3) 
    a=[1 5 9 12];
end


