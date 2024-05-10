%Kounsolas Xristos ΑΕΜ:10345
%Plevridi Vasiliki Varvara ΑΕΜ:10454

function[] = Group18Exe8Fun3(hour_array,h,row_names)
    results = array2table(h);
    results.Properties.RowNames = row_names;
    results.Properties.VariableNames = hour_array;
    disp(results)
    fprintf("\n")
end