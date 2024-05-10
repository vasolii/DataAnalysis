%Kounsolas Xristos ΑΕΜ:10345
%Plevridi Vasiliki Varvara ΑΕΜ:10454

function Group18Exe7Fun2(adjr2,transform_x,transform_y,k_final,hour)
warning off all
%DHMIOYRGIA TELIKOY PINAKA
results=array2table(adjr2);
transform_x_string = strcat("x'=",transform_x); %gia na dhmioyrgei strings 1x24
transform_y_string= strcat("y'=",transform_y);
results.transform_x=transform_x_string;
results.transform_y=transform_y_string;
results.k=k_final;
results.Properties.RowNames = hour; % prosthiki onomatwn gia rows
disp(results)
end