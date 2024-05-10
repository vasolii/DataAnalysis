%Kounsolas Xristos ΑΕΜ:10345
%Plevridi Vasiliki Varvara ΑΕΜ:10454

%painro san orisma ta dianysma adjR2_s1,adjR2_s2 
% poy periexoun to adjR2 gia MIA ORA tis epoxis 
%kai ta bikes_temperatures_s1/2 poy periexoun ta bikes
%kai tis temperatures GIA MIA ORA tis epoxis
function[h] = Group18Exe8Fun2(adjR2_s1,adjR2_s2,bikes_temperatures_s1,bikes_temperatures_s2)
    %GIA MIA ORA 
    B = 1000;
    a = 0.05;
    bikes_s1 = bikes_temperatures_s1(:,1);
    temperatures_s1 = bikes_temperatures_s1(:,2);
    n = length(bikes_s1);
    bikes_s2 = bikes_temperatures_s2(:,1);
    temperatures_s2 = bikes_temperatures_s2(:,2);
    m = length(bikes_s2);

    bikes_all = [bikes_s1; bikes_s2];
    temperatures_all = [temperatures_s1; temperatures_s2];

    theta = adjR2_s1 - adjR2_s2;
    
    theta_hat = theta; 
    for i=2:B+1
    indexes = randperm(n+m);

    bikes_s1_r = bikes_all(indexes(1:n));
    temperatures_s1_r = temperatures_all(indexes(1:n));

    bikes_s2_r = bikes_all(indexes(n+1:end));
    temperatures_s2_r = temperatures_all(indexes(n+1:end));
    
    adjR2_s1_r = Group18Exe8Fun1([bikes_s1_r temperatures_s1_r]);
    adjR2_s2_r = Group18Exe8Fun1([bikes_s2_r temperatures_s2_r]);

    theta_hat(i) = adjR2_s1_r - adjR2_s2_r; 
    end

    theta_hat = sort(theta_hat);
    r = find(theta_hat == theta );

    if r<(B+1)*a/2 | r>(B+1)*(1-a/2)
        h = 1; % aporriptetai  i ypothesi oti exoun iso adjR2
    else
        h = 0; %apodexomaste oti exoun iso adjR2
    end

end