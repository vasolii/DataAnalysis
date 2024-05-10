%Kounsolas Xristos ΑΕΜ:10345
%Plevridi Vasiliki Varvara ΑΕΜ:10454

function Group18Exe5Fun2(r,relationship,direction,h)
%Colormaps
%Colormap for linear Correlation
figure();
imagesc(r);
colorbar;

%Titles and Labels
title("Colormap for linear Correlation","Rented Bike Count - Temperature(°C)");
xlabel("Hours","FontWeight","bold");
ylabel("Seasons","FontWeight","bold");

% AXIS
xticks(1:24);
xtickangle(0);
yticks(1:4);
yticklabels({'Winter','Spring','Summer','Autumn'});
ytickangle(90);

% Absolute Value of r              Strength of Relationship
% r < 0.3                          None or very weak - 1
% 0.3 < r <0.5                     Weak - 2
% 0.5 < r < 0.7                    Moderate -3
% r > 0.7                          Strong - 4

%Colormap for linear Correlation-Strength of Relationship
figure();
imagesc(relationship);
colormap(lines(4));
c=colorbar;

%Idiothtes colorbar
c.Ticks=[1,2,3,4];
c.Limits=[1,4];
c.TickLabels=["None or very weak","Weak","Moderate","Strong"];
clim([1, 4]);

%Titles and Labels
title("Colormap for linear Correlation-Strength of Relationship","Rented Bike Count - Temperature(°C)");
xlabel("Hours","FontWeight","bold");
ylabel("Seasons","FontWeight","bold");

% AXIS
xticks(1:24);
xtickangle(0);
yticks(1:4);
yticklabels({'Winter','Spring','Summer','Autumn'});
ytickangle(90);

%Colormap for linear Correlation-Direction
figure();
imagesc(direction);
colormap(lines(2));
c1=colorbar;

%Idiothtes colorbar
c1.Ticks=[0,1];
c1.TickLabels=["Negative Association","Positive Association"];
clim([0, 1]);

%Titles and Labels
title("Colormap for linear Correlation-Direction","Rented Bike Count - Temperature(°C)");
xlabel("Hours","FontWeight","bold");
ylabel("Seasons","FontWeight","bold");

% AXIS
xticks(1:24);
xtickangle(0);
yticks(1:4);
yticklabels({'Winter','Spring','Summer','Autumn'});
ytickangle(90);

%Colormap hypothessis testing for ρ=0
figure();
imagesc(h);
colormap(lines(2));
c1=colorbar;

%Idiothtes colorbar
c1.Ticks=[0,1];
c1.TickLabels=["h=0","h=1"];
clim([0, 1]);

%Titles and Labels
title("Colormap for linear Correlation-Hypothessis testing for ρ=0","Rented Bike Count - Temperature(°C)");
xlabel("Hours","FontWeight","bold");
ylabel("Seasons","FontWeight","bold");

% AXIS
xticks(1:24);
xtickangle(0);
yticks(1:4);
yticklabels({'Winter','Spring','Summer','Autumn'});
ytickangle(90);

end