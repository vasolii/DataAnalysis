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

for i=1:24
    hour(i,1)=sprintf("Hour %d",i);
    winter_bikes(:,i)=table2array(data(data.Seasons==1 & data.Hour==i-1,"Rented Bike Count"));
    spring_bikes(:,i)=table2array(data(data.Seasons==2 & data.Hour==i-1,"Rented Bike Count"));
    summer_bikes(:,i)=table2array(data(data.Seasons==3 & data.Hour==i-1,"Rented Bike Count"));
    autumn_bikes(:,i)=table2array(data(data.Seasons==4 & data.Hour==i-1,"Rented Bike Count"));
end
     

p(1,:)=Group18Exe4Fun1(winter_bikes,spring_bikes,"Winter","Spring");
p(2,:)=Group18Exe4Fun1(winter_bikes,summer_bikes,"Winter","Summer");
p(3,:)=Group18Exe4Fun1(winter_bikes,autumn_bikes,"Winter","Autumn");
p(4,:)=Group18Exe4Fun1(spring_bikes,summer_bikes,"Spring","Summer");
p(5,:)=Group18Exe4Fun1(spring_bikes,autumn_bikes,"Spring","Autumn");
p(6,:)=Group18Exe4Fun1(summer_bikes,autumn_bikes,"Summer","Autumn");

row_names=["Winter-Spring","Winter-Summer","Winter-Autumn","Spring-Summer","Spring-Autumn","Summer-Autumn"];

Group18Exe4Fun2(p,hour,row_names);

%SXOLIA GIA APOTELESMATA
%Ta apotelesmata poy prokyptoyn einai ta ekshs:
%winter-Spring:yparxei aisthth diafora enoiikiashs podhlatwn gia oles tis
%wres ths hmeras. To idio isxyei kai gia ta zeygaria: winter-summer kai
%winter-autumn. To zeygari spring- summer parathroyme oti apo tis 12 to
%meshmeri mexri tis 6 to apogeyma oi enoikiaseis podhlatwn einai
%paraplhsies. Gia to zeygari spring-autumn: thn wra 8 kai tis wres 1 me 11
%to brady, kai telos summer-autumn: 8 me 1 to prwi kai 4 me 7 to apogeyma.
