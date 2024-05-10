%Kounsolas Xristos ΑΕΜ:10345
%Plevridi Vasiliki Varvara ΑΕΜ:10454

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

% to have access in a column of a cell use : 
% name_of_cell(:,"name_of_column")
winter_bikes=table2array(data(data.Seasons==1,"Rented Bike Count"));
spring_bikes=table2array(data(data.Seasons==2,"Rented Bike Count"));
summer_bikes=table2array(data(data.Seasons==3,"Rented Bike Count"));
autumn_bikes=table2array(data(data.Seasons==4,"Rented Bike Count"));

%winter = 1
%spring = 2
%summer = 3
%autumn = 4

result=zeros(4,4);
seasons=["Winter:1","Spring:2","Summer:3","Autumn:4"];

result(1,2)=Group18Exe2Fun1(100,winter_bikes,spring_bikes);
result(1,3)=Group18Exe2Fun1(100,winter_bikes,summer_bikes);
result(1,4)=Group18Exe2Fun1(100,winter_bikes,autumn_bikes);
result(2,3)=Group18Exe2Fun1(100,spring_bikes,summer_bikes);
result(2,4)=Group18Exe2Fun1(100,spring_bikes,autumn_bikes);
result(3,4)=Group18Exe2Fun1(100,summer_bikes,autumn_bikes);

result = triu(result) + triu(result, 1)';
%apla kanw symmetriko ton pinaka
%bazw thn idia timh sto stoixeio 1,2 kai sto 2,1

result=array2table(result);
result.Properties.RowNames =seasons;
result.Properties.VariableNames=seasons;
disp(result);

%SXOLIA GIA APOTELESMATA
%Ta apotelesmata gia deigma apo kathe epoxh mhkoys 100 den einai ayta poy
%tha perimename akribws. Gegonos poy einai apolyta logiko an skeftoyme to
%mhkos toy arxikoy sample.den mporoume me toso mikro deigma na bgaloyme
%symperasmata. H anakribeia twn apotelesmatwn fainetai poly entona apo tis
%sygkriseis me xeimwna kai gia ypoloipes epoxes.Blepoyme oti to pososto
%omoiothtas twn katanomwn twn 2 epoxwn px xeimwna kai anoikshs einai idio
%me ayto anoikshs kai kalokairioy. An symboleytoyme kai thn askhsh 1,
%blepoyme oti o xeimwnas eidika katanemetai poly diaforetika ston aksona x
%Gia na odhghthoume se poly pio real apotelesmata, dokimasame na allaksoyme
%to mhkos toy sample poy tha sygkrithei sta 500 (anti gia 100) kai me edges
%50 odhghthkame sta parakatw apotelesmata:

%             Winter:1    Spring:2    Summer:3    Autumn:4
%             ________    ________    ________    ________
% 
% Winter:1        0          14           1           2   
% Spring:2       14           0          69          40   
% Summer:3        1          69           0          63   
% Autumn:4        2          40          63           0  

% Poly pio logika apotelesmata (3-1 logiko na exoyn mhdaminh omoiothta kai
% 3-2,4-2 arketa megalh) 

