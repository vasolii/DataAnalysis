%Kounsolas Xristos ΑΕΜ:10345
%Plevridi Vasiliki Varvara ΑΕΜ:10454

function [r,relationship,direction,h]=Group18Exe5Fun1(bikes)

%arxikopoiisi ton vectors
r = NaN * ones(24,1);
direction = NaN*ones(24,1);
relationship = NaN*ones(24,1);

for i=1:24
    %brisko to r gia kathe ora tis imeras metaksi bikes kai temperature
    ro=corrcoef(bikes(:,2*i-1),bikes(:,2*i));
    r(i)=ro(1,2);

    %Direction
    if r(i)>=0
       direction(i)=1;
    else 
        direction(i)=0;
    end

    %relationship
    % Absolute Value of r              Strength of Relationship
    % r < 0.3                          None or very weak - 1
    % 0.3 < r <0.5                     Weak - 2
    % 0.5 < r < 0.7                    Moderate -3
    % r > 0.7                          Strong - 4

    if abs(r(i))>0.7
        relationship(i)=4;
    elseif (0.5 < abs(r(i))) && (abs(r(i))< 0.7)  
        relationship(i)=3;
    elseif (0.3 < abs(r(i))) && (abs(r(i))<0.5)  
        relationship(i)=2;
    elseif abs(r(i)) < 0.3
        relationship(i)= 1;
    end    
end

a=0.05;
n=length(bikes);

z=0.5*log((1+r)./(1-r)); %5.3
t=norminv(1-a/2);

%διάστημα εμπιστοσύνης

low_z=z-t*sqrt(1/(n-3)); %vectors
high_z=z+t*sqrt(1/(n-3)); %vectors

t = r .* sqrt((n-2)./(1-r.^2));
tc = tinv(1-a/2, n-2);
h=abs(t)<tc; %eksigise mou tin theoreia piso apo ayto

end