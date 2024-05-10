%Kounsolas Xristos ΑΕΜ:10345
%Plevridi Vasiliki Varvara ΑΕΜ:10454

function [maxadjR2,option_x,option_y,k]=Group18Exe7Fun1(bikes_temperature_hour,hour)
    warning off all
    %thelo na bro tin eksartisi ton podilaton apo tin thermmokrasia
    %ara thermokrasia = x
    % podilata = y
    
    x = bikes_temperature_hour(:,2); %temperature aneksartiti metabliti
    y = bikes_temperature_hour(:,1); %bikes eksartimeni
    n=length(x);
    k=1; %arithmos aneksartiton metabliton

    %Transformations for x,y
    x_options=[x x.^2 x.^3 x.^4 exp(0.01*x) exp(0.1*x)];
    y_options=[y y.^2 y.^3 y.^4 log(y)] ;
    
    %kano olous toys dynatoys syndyasmous apo pano
    for k=1:5
    for j=1:size(x_options,2) %gia diafora x
        xM = [ones(n,1) x_options(:,j)]; %to xreiazomai mono gia na to balo mesa stin regress()
        for i=1:size(y_options,2)  %gia diafora y
            yV = y_options(:,i);
            if k==1
            [bV,~,~,~,stats]=regress(yV,xM);% se kathe sthlh ana dyo grammes gia kathe x option
            elseif k==2
            [bV,~,~,~,stats]=regress(yV,[xM x_options(:,j).^2]);
            elseif k==3
            [bV,~,~,~,stats]=regress(yV,[xM x_options(:,j).^2 x_options(:,j).^3]);
            elseif k==4
            [bV,~,~,~,stats]=regress(yV,[xM x_options(:,j).^2 x_options(:,j).^3 x_options(:,j).^4]);
            elseif k==5
            [bV,~,~,~,stats]=regress(yV,[xM x_options(:,j).^2 x_options(:,j).^3 x_options(:,j).^4 x_options(:,j).^5]);
            end
            R2=stats(1); % seira: y_option sthlh:x_option %as ypotheso oti einai sosto
            adjR2(k,j,i)=1-((n-1)/(n-(k+1)))*(1-R2); %as ypotheso oti einai sosto
        end
    end
    end
    
    x_names = ["x" "x^2" "x^3" "x^4" "e^(0.01x)" "e^(0.1x)"]; %"exp(x)" "exp(x+1)"
    y_names = ["y" "y^2"  "y^3" "y^4" "lny" ]; %"exp(y)" "exp(y+1)"
    
    %EPISTREPSIMES TIMES
    %thelo na pairno to max adjR2 apo kathe grammi
    [maxadjR2,index]=max(adjR2(:));
    [k,row_x, col_y] = ind2sub(size(adjR2), index);
    if k==1
      xM_max=[ones(n,1) x_options(:,row_x)];
    elseif k==2
      xM_max=[ones(n,1) x_options(:,row_x) x_options(:,row_x).^2];
    elseif k==3
      xM_max=[ones(n,1) x_options(:,row_x) x_options(:,row_x).^2 x_options(:,row_x).^3];
    elseif k==4
      xM_max=[ones(n,1) x_options(:,row_x) x_options(:,row_x).^2 x_options(:,row_x).^3 x_options(:,row_x).^4];
    elseif k==5
      xM_max=[ones(n,1) x_options(:,row_x) x_options(:,row_x).^2 x_options(:,row_x).^3 x_options(:,row_x).^4 x_options(:,row_x).^5];
    end
    bV_max = regress(y_options(:,col_y),xM_max);
    yhatmax = xM_max*bV_max;

     option_x=x_names(row_x);
     option_y=y_names(col_y);
    
    %paroysiash grafika
    figure();
    scatter(x_options(:,row_x),y_options(:,col_y));
    xlabel("Temperature");
    ylabel("Rented Bike Count");
    title(sprintf("Scatter diagram with trnasformed x,y-Hour %d",hour));
    hold on;
    [x_sorted,idx]=sort(x_options(:,row_x));
    y_sorted=yhatmax(idx);
    plot(x_sorted,y_sorted,"LineWidth",1.5);
    hold off;
end