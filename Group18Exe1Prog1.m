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

%to have access in a column of a cell use : 
% name_of_cell(:,"name_of_column")

winter_bikes=table2array(data(data.Seasons==1,"Rented Bike Count"));
spring_bikes=table2array(data(data.Seasons==2,"Rented Bike Count"));
summer_bikes=table2array(data(data.Seasons==3,"Rented Bike Count"));
autumn_bikes=table2array(data(data.Seasons==4,"Rented Bike Count"));

Group18Exe1Fun1(winter_bikes,"Winter");
Group18Exe1Fun1(spring_bikes,"Spring");
Group18Exe1Fun1(summer_bikes,"Summer");
Group18Exe1Fun1(autumn_bikes,"Autumn");

%SXOLIA GIA TA APOTELESMATA 
%Opws fainetai kai apo ta grafika kai oxi mono apotelesmata, h katanomh
%Kernel einai ayth poy prosoeggizei kalytera ola ta dedomena mas metaksy twn
%gnwstwn katanomwn.Gia ton xeimwna, exoyme arketa kalh proseggish h opoia
%fainetai apo thn timh p kai epalhtheyetai kai apo to grafhma. Thn
%xeiroterh exei to fthinwporo

