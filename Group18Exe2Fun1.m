%Kounsolas Xristos ΑΕΜ:10345
%Plevridi Vasiliki Varvara ΑΕΜ:10454

function sd_rate=Group18Exe2Fun1(M,bikes1,bikes2)
    for i=1:M
        bikes1_sample = datasample(bikes1, 100, 'Replace', false);
        bikes2_sample = datasample(bikes2, 100, 'Replace', false);

        [bikes1_hist, edges] = histcounts(bikes1_sample, 20);
        bikes2_hist = histcounts(bikes2_sample, edges);

        h(i)= chi2gof(edges(1:end-1), 'Frequency', bikes1_hist, 'Expected', bikes2_hist, 'EMin', 1);
    end
    sum_h=sum(h);%h=1 for rejection
    sd_rate=(M-sum_h)*100/M;
end