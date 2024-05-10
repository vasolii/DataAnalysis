%Kounsolas Xristos ΑΕΜ:10345
%Plevridi Vasiliki Varvara ΑΕΜ:10454

clc;
clear;
close all;

data=readtable("SeoulBike.xlsx",'VariableNamingRule','preserve');

%kanw elegxo gia kathe mera an exei kai tis 24 wres
%an den tis exei, thn diagrafw
j=1;
while j<height(data)
    if table2array(data(j,"Hour"))~=0
        fprintf("Delete %s because doenst have data for 24 hours\n",data.Date(j));
        data(data.Date==data.Date(j),:)=[];
    else 
        j=j+24;
    end
   
end 

for i=1:24
    winter_bikes(:,i)=table2array(data(data.Seasons==1 & data.Hour==i-1,"Rented Bike Count"));
    spring_bikes(:,i)=table2array(data(data.Seasons==2 & data.Hour==i-1,"Rented Bike Count"));
    summer_bikes(:,i)=table2array(data(data.Seasons==3 & data.Hour==i-1,"Rented Bike Count"));
    autumn_bikes(:,i)=table2array(data(data.Seasons==4 & data.Hour==i-1,"Rented Bike Count"));
end

Group18Exe3Fun1(winter_bikes,"Winter");
Group18Exe3Fun1(spring_bikes,"Spring");
Group18Exe3Fun1(summer_bikes,"Summer");
Group18Exe3Fun1(autumn_bikes,"Autumn");

%SXOLIA GIA TA APOTELESMATA
%Oysiastika, oi pinakes poy prokyptoyn einai symmetrikoi me thn diagwnio na 
% einai epishs axrhsth giati tha ypologizei thn diafora anamesa se ayto kai 
% sto idio.Ara:(576-24)/2=276 zeygaria

% H anoiksh kai to fthinwporo parathroyme oti odhgoyn se paraplhsia
% apotelesmata

%Genikh parathrhsh: wres poy einai konta sthn diagwnio (dhladh kontines
%wres metaksy toys) fainetai na exoyn epishs paraplhsies meses times
%enoikiasewn podhlatwn 
