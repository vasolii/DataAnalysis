%Kounsolas Xristos ΑΕΜ:10345
%Plevridi Vasiliki Varvara ΑΕΜ:10454

function Group18Exe3Fun1(bikes_hour,season)
for i=1:24
    for j=1:24
        %h=1 => rejection
        h_p(i,j)=ttest2(bikes_hour(:,i),bikes_hour(:,j));% h kathe grammh einai to iosto me ola(j)
        difference_mean(i,j)=abs(mean(bikes_hour(:,i))-mean(bikes_hour(:,j)));
    end
end 

figure();
imagesc(h_p);
colormap(parula(2));
c1=colorbar;

%Idiothtes colorbar
c1.Ticks=[0,1];
c1.TickLabels=["h=0","h=1"];
clim([0, 1]);

%Titles and Labels
title(sprintf("Colormap of  test decision - %s",season));
xlabel("Hours");
ylabel("Hours");

% AXIS
xticks(1:24);
xtickangle(0);
yticks(1:24);
ytickangle(0);

figure();
imagesc(difference_mean);
colorbar;

%Titles and Labels
title(sprintf("Colormap of difference of means - %s",season));
xlabel("Hours");
ylabel("Hours");

% AXIS
xticks(1:24);
xtickangle(0);
yticks(1:24);
ytickangle(0);
end