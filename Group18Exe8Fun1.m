%Kounsolas Xristos ΑΕΜ:10345
%Plevridi Vasiliki Varvara ΑΕΜ:10454

%pairnei san orisma ta bikes,temperature GIA MIA ora
function [adjR2] = Group18Exe8Fun1(bikes_temperature_hour)
    %ypologisei ton synetlesti prodsiorismou gia metaksi bikes
    %kai temperature gia mia sygkekrimeni ora ki ton epistrefei
    xV = bikes_temperature_hour(:,2); %temperature aneksartiti metabliti
    yV = bikes_temperature_hour(:,1); %bikes eksartimeni metabliti
    n= length(xV);
    
    xM = [ones(n,1) xV];
    bV = regress(yV,xM);
    yhatV = xM*bV;
    my = mean(yV);
    eV = yV - yhatV;
    adjR2 =1-((n-1)/(n-2))*(sum(eV.^2))/(sum((yV-my).^2)); %5.29
end