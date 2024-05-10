%Kounsolas Xristos ΑΕΜ:10345
%Plevridi Vasiliki Varvara ΑΕΜ:10454

warning off all
clc;
clear;
close all;

%with readtable the data type is a cell
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
    %ta dedomena briskontai ana sthles, kathe zeygari dyo sthlwn
    %antistoixei se diaforetikh wra
    winter_bikes_temperature(:,2*i-1:2*i)=table2array(data(data.Seasons==1 & data.Hour==i-1,["Rented Bike Count","Temperature(°C)"]));
    spring_bikes_temperature(:,2*i-1:2*i)=table2array(data(data.Seasons==2 & data.Hour==i-1,["Rented Bike Count","Temperature(°C)"]));
    summer_bikes_temperature(:,2*i-1:2*i)=table2array(data(data.Seasons==3 & data.Hour==i-1,["Rented Bike Count","Temperature(°C)"]));
    autumn_bikes_temperature(:,2*i-1:2*i)=table2array(data(data.Seasons==4 & data.Hour==i-1,["Rented Bike Count","Temperature(°C)"]));
end 


for i=1:24
    %[adjr2(i,1),transform_x(i,1),transform_y(i,1),k_final(i,1)]=Group18Exe7Fun1(winter_bikes_temperature(:,2*i-1:2*i),i-1);
    [adjr2(i,1),transform_x(i,1),transform_y(i,1),k_final(i,1)]=Group18Exe7Fun1(spring_bikes_temperature(:,2*i-1:2*i),i-1);
    %[adjr2(i,1),transform_x(i,1),transform_y(i,1),k_final(i,1)]=Group18Exe7Fun1(summer_bikes_temperature(:,2*i-1:2*i),i-1);
    %[adjr2(i,1),transform_x(i,1),transform_y(i,1),k_final(i,1)]=Group18Exe7Fun1(autumn_bikes_temperature(:,2*i-1:2*i),i-1);
    hour(i,1)=sprintf("Hour %d",i);
end    
%DHMIOYRGIA TELIKOY PINAKA
Group18Exe7Fun2(adjr2,transform_x,transform_y,k_final,hour);

%SXOLIA GIA APOTELESMATA

%Oysiastikika phra y=a+bx kai ekana diaforous transformations kai gia to y
%kai gia to x kai oloys toys pithanous syndiasmous. Epishs ekana gia k=1:5
%px an k=2 y'=y kai x'=e(0.1x) tha einai to equation
%y=a+be(0.1x)+c(e(0.1x))^2

%Gia kapoia hours oti equation kai na bazw h timh toy adjr2 paramenei
%parapoly mikrh. Ayto nomizw exei na kanei me to correlation. Sthn askhsh 5
%px parathrhsame gia ton xeimwna oti tis wres 7 8 9 h sysxetish einai para poly mikrh.
%Logiko loipon einai ta shmeia toy scatter diagram na einai katanemhmena
%einai wste na mhn mporoyn na proseggistoyn apo mia synarthsh eykola(
%toylaxiston tetoias klimakas). To idio prokyptei kai apo ta apotelesmata
%MIC kai GMIC ths askhshs 6

%h diafora genika gia diaforetika k einai poly mikrh. nomizw oti h aykshsh
%ths polyplokothtas en telei den prosferei kati kai isws tha eprepe na
%epistrepsoyme sta pio apla montela

%gia na mhn einai terastio xronika to programma h kathe epoxh testarete
%ksexwrista kai xeirokinhta
