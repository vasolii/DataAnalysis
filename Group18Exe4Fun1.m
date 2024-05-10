%Kounsolas Xristos ΑΕΜ:10345
%Plevridi Vasiliki Varvara ΑΕΜ:10454

function h_b=Group18Exe4Fun1(bikes1,bikes2,season1,season2) 
    %Bootstrap
    N=1000;
    bootstrap_results_x=bootstrp(N,@median,bikes1);
    bootstrap_results_y=bootstrp(N,@median,bikes2);
    bootstrap_statistic=bootstrap_results_x-bootstrap_results_y;
    bootstrap_statistic = sort(bootstrap_statistic, 1);
    alpha=0.05;
    ci_vector_low=floor((N+1)*alpha/2); %floor: gia akeraio meros
    ci_vector_high=N+1-ci_vector_low; %theseis twn oriwn se pinaka me aykousa seira

    x = 0:23;
    figure;
    hold on;
    for i = 1:24
        ci_b_low(i) = bootstrap_statistic(ci_vector_low, i);
        ci_b_high(i) = bootstrap_statistic(ci_vector_high, i);

        line([x(i), x(i)], [ci_b_low(i), ci_b_high(i)], 'Color',"k" , 'LineWidth', 2);

        if (ci_b_low(i) <= 0 && ci_b_high(i) >= 0) % sthn periptwsh mas theloume to mhden na anhkei sto d.e.
            h_b(i)=0; %dekth
            color = 'g';
        else 
            h_b(i)=1; %απορριψη
            color = 'r';
        end
    scatter(x(i), 0, 50, color, 'filled');
    end
    
    xticks(1:24);
    xtickangle(0);
    xlabel ("Hours");
    ylabel("Bootstrap conficence interval");
    title(sprintf("%s vs %s",season1,season2));
    hold off;
end

