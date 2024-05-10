%Kounsolas Xristos ΑΕΜ:10345
%Plevridi Vasiliki Varvara ΑΕΜ:10454

%theloume na diereynisoume an to grammiko montelo tis enoikiasis 
%podilaton  apo ti thermokrasia gia mia sygkekrimeni ora tis imeras
%prosarmozetai to idio kala stis 2 epoxes

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
        fprintf("Delete %s because doesn't have data for 24 hours\n",data.Date(j));
        data(data.Date==data.Date(j),:)=[];
    else 
        j=j+24;
    end
   
end    

for i=1:24
    hour_array(i,1)=sprintf("Hour %d",i);
    %ta dedomena briskontai ana sthles, kathe zeygari dyo sthlwn
    %antistoixei se diaforetikh wra
    winter_bikes_temperature(:,2*i-1:2*i)=table2array(data(data.Seasons==1 & data.Hour==i-1,["Rented Bike Count","Temperature(°C)"]));
    spring_bikes_temperature(:,2*i-1:2*i)=table2array(data(data.Seasons==2 & data.Hour==i-1,["Rented Bike Count","Temperature(°C)"]));
    summer_bikes_temperature(:,2*i-1:2*i)=table2array(data(data.Seasons==3 & data.Hour==i-1,["Rented Bike Count","Temperature(°C)"]));
    autumn_bikes_temperature(:,2*i-1:2*i)=table2array(data(data.Seasons==4 & data.Hour==i-1,["Rented Bike Count","Temperature(°C)"]));
end 

%prepei na ypologiso ton syntelesti prosdiorismou metaksi 
%bikes kai temperature gia kathe ora mias epoxis
for hour=1:24
    adjR2_winter(hour,1) = Group18Exe8Fun1(winter_bikes_temperature(:,2*hour-1:2*hour));
    adjR2_spring(hour,1) = Group18Exe8Fun1(spring_bikes_temperature(:,2*hour-1:2*hour));
    adjR2_summer(hour,1) = Group18Exe8Fun1(summer_bikes_temperature(:,2*hour-1:2*hour));
    adjR2_autumn(hour,1) = Group18Exe8Fun1(autumn_bikes_temperature(:,2*hour-1:2*hour));
end

adjR2 = [adjR2_winter';adjR2_spring';adjR2_summer';adjR2_autumn'];
row_names_adjR2 = ["Winter", "Spring", "Summer", "Autumn"];

%afoy brika to adjR2 kathe oras kathe epoxis
%prepei na elenxo tora an to adjR2 poy brika diaferei stis 2 epoxes,
%opote prepei na kano elenxo isotitas metaksi ton 2 synteleston 
%prosdiorismou

for hour=1:24
    h_winter_spring(hour) = Group18Exe8Fun2(adjR2_winter(hour),adjR2_spring(hour),winter_bikes_temperature(:,2*hour-1:2*hour),spring_bikes_temperature(:,2*hour-1:2*hour));
    h_winter_summer(hour) = Group18Exe8Fun2(adjR2_winter(hour),adjR2_summer(hour),winter_bikes_temperature(:,2*hour-1:2*hour),summer_bikes_temperature(:,2*hour-1:2*hour));
    h_winter_autumn(hour) = Group18Exe8Fun2(adjR2_winter(hour),adjR2_autumn(hour),winter_bikes_temperature(:,2*hour-1:2*hour),autumn_bikes_temperature(:,2*hour-1:2*hour));
    h_spring_summer(hour) = Group18Exe8Fun2(adjR2_spring(hour),adjR2_summer(hour),spring_bikes_temperature(:,2*hour-1:2*hour),summer_bikes_temperature(:,2*hour-1:2*hour));
    h_spring_autumn(hour) = Group18Exe8Fun2(adjR2_spring(hour),adjR2_autumn(hour),spring_bikes_temperature(:,2*hour-1:2*hour),autumn_bikes_temperature(:,2*hour-1:2*hour));
    h_summer_autumn(hour) = Group18Exe8Fun2(adjR2_summer(hour),adjR2_autumn(hour),summer_bikes_temperature(:,2*hour-1:2*hour),autumn_bikes_temperature(:,2*hour-1:2*hour));
end

h = [h_winter_spring;h_winter_summer;h_winter_autumn;h_spring_summer;h_spring_autumn;h_summer_autumn];
row_names_h=["Winter-Spring","Winter-Summer","Winter-Autumn","Spring-Summer","Spring-Autumn","Summer-Autumn"];

%parousiazo to adjR2 tis grammikis prosarmogis gia kathe season 
Group18Exe8Fun3(hour_array,adjR2,row_names_adjR2);

%parousiazo an to adjR2 ton 2 epoxon einai paroimio
%h=0 apodoxi
%h=1 aporipsi
Group18Exe8Fun3(hour_array,h,row_names_h);


%PREPEI NA PAROUSIASO AN O SYNELESTIS PROSDIORISMOU DIAFEREI STIS 2 EPOXES
%gia to zeygari winter-spring
%paratiroume oti exoun paromoio adjR2 gia oles tis ores ektos apo tis
%apogeymatobradines(18 - 22), to opoio einia logiko giati aytes oi 2 epoxes
%emfanizoun paromoies kairikes synthikes tis ypoloipoes ores, diladi kais
%tis 2 epoxes to proi yparxei kryo kai kathos pernaei i ora anebainei i
%htermokrasia me apotelesma na enoikiazontai pio polla podilato. Episis to
%brady yparxei kryo me apotelesma o arithmos ton podilaton na meionetai.
%Monadiki diafora paratiritai stis ores (18-22) kathos tin anoiksi i mera
%einai megalyteri kai tis sygkekrimenes ores yparxei sxetika kalos kairos
%se antitheis me ton xeimona, poy bradyazei noris kai epikratei kryo.

%gia to zeygari winter-summer
%paratiroume oti exoun paromoio adjR2 mono stis ores 6-10 kai 19-20 kai se
%oles tis ypoloipoes to adjR2 tous diaferei, kati pou einai logiko kathos
%o arithmos ton podilaton ton xeimona eksartatai apo tin thermokrasia se
%antirthesi me to kalokairi poy o kairos einia panta kalos. Stis ores 6-10
%poy blepoume oti exoun paromoia adjR2 einai giati kai gia tis 2 epoxes to
%adjR2 proseggizei to miden, dld gia tis sygkekrimenes ores o arithmos ton
%podilaton den eksartatai apot in thermokrasia kati pou isos ofeiletai sto
%oti einai poly noris.

%gia to zeygari winter-autumn
%paratiroume oti gia to sygkekrimeno zeygari isxyoun oti eipame gia kai to
%zeygari winter-spring. 
% Paratiroume oti exoun paromoio adjR2 gia oles tis ores ektos apo tis
%apogeymatobradines(19 - 22), to opoio einia logiko giati aytes oi 2 epoxes
%emfanizoun paromoies kairikes synthikes tis ypoloipoes ores, diladi kai
%Stis 2 epoxes to proi yparxei kryo kai kathos pernaei i ora anebainei i
%THermokrasia me apotelesma na enoikiazontai pio polla podilatA. Episis to
%brady yparxei kryo me apotelesma o arithmos ton podilaton na meionetai.
%Monadiki diafora paratiritai stis ores (19-22) kathos to autumn i mera
%einai megalyteri kai tis sygkekrimenes ores yparxei sxetika kalos kairos
%se antithesi me ton xeimona, poy bradyazei noris kai epikratei kryo.

%gia to zeygari spring-summer
%paratiroume oti gia tis perissoteres ores to adjR2 diaferei stis 2 epoxes,
%kati pou isos ofeiletai sto gegonos oti tin anoiksi o kairos den einai
%toso kalos oso to kalokairi me apotelesma mia meiosi px tis thermokrasias
%tin anoiksi na epireazei ton arithmo ton enoikiazomenon podilaton se
%antithesi me kati antistoixo to kalokairi pou tha afine ton sygkekrimeno
%arithmo anypireasto,
%Eksairountai oi ores 3-4 kai 6-9, kathos to adjR2 kai gia tis 2 epoxes einai
%konta sto miden, kati pou isos ofeiletai sto oti eite einai kalos eite
%kakos o kairos einai den epireazetai simantika o arithmos ton
%enoikiazomenon podilaton afou einai poly proi.

%gia to zeygari spring-autumn
%paratiroume oti to sygkekrimeno zeygari exei paromoio adjR2, kathos
% einai epoxes me paromoies kairikes synthikes , me apotelesma i 
% symperifora ton anthropon os pros tin enoikiasi podilaton na einai kai
% ayti paromoia. Monadiki eksairesi oi 3 ores (9,10,19), pou einai poly
% liges gia na bgaloume kapoio symperasma

%gia to zeygari summer-autumn
%paratiroume oti gia to sygkekrimeno zeygari isxyoun oti eipame gia kai to
%zeygari spring-summer. 
%%paratiroume oti gia tis perissoteres ores to adjR2 diaferei stis 2 epoxes,
%kati pou isos ofeiletai sto gegonos oti to fthinoporo o kairos den einai
%toso kalos oso to kalokairi me apotelesma mia meiosi px tis thermokrasias
%na epireazei ton arithmo ton enoikiazomenon podilaton se
%antithesi me kati antistoixo to kalokairi pou tha afine ton sygkekrimeno
%arithmo anypireasto,
%Eksairountai oi ores 7-10, kathos to adjR2 kai gia tis 2 epoxes einai
%konta sto miden, kati pou isos ofeiletai sto oti eite einai kalos eite
%kakos o kairos einai den epireazetai simantika o arithmos ton
%enoikiazomenon podilaton afou einai proi.


%PREPEI NA SXOLIASO AN H GRAMMIKI PROSARMOGI EINA TO IDIO KALI GIA OLES TIS
%EPOXES

for i=1:4
    subplot(4,1,i);
    plot(1:24,adjR2(i,:),"LineWidth",1.5);
    xlabel("Hours");
    ylabel("adjR2");
    title(row_names_adjR2(i));
end

%apo to figure(1) blepo oti gia ton xeimona, tin anoiksi, kai to fthinoporo gia
%kapoies ores tis imeras mporoume na poume oti to montelo eksigei ena metrio
%pososto tis metablitotas tis eksartimenis metablitis (number of rented
%bikes), kathos o kairos stis sygkekrimenes epoxes den einai toso kalos oso
% to kalokairi me apotelesma px i meiosi tis thermokrasias na epireazei arnitika
% ton arithmo tis enoikiasis ton podilaton. H prosarmogi einai logiki alla 
% yparxei xoros gia beltiosi. 
% Isos me kapoio allo montelo to adjR2 ton trion epoxon na itan megalytero.
%Antithetos gia to kalokairi o syntelestis prosdiorismoy einai poly mikros,
%konta sto miden, me apotelesma symbairenoume oti to grammiko montelo
%eksigei mono ena mikro pososto tis metabltitotitas ton enoikiazomenon
%podilaton, to opoio einai logiko kathos to kalokairi o kairos einai
%kalos panta, opote eite ayksithei eite meiothei i thermokrasia den tha
%epireasei ton arithmo ton enoikiazomenon podilaton.

