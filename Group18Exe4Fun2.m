%Kounsolas Xristos ΑΕΜ:10345
%Plevridi Vasiliki Varvara ΑΕΜ:10454

function Group18Exe4Fun2 (p,hour,row_names)
    results=array2table(p);
    results.Properties.RowNames =row_names;
    results.Properties.VariableNames=hour;
    disp(results);
end