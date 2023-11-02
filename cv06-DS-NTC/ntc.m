clear all; close all;
%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 2);

% Specify range and delimiter
opts.DataLines = [1, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["t", "r"];
opts.VariableTypes = ["double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
tbl = readtable("C:\Temp\xkolar74\MKS2023\cv06-DS-NTC\ntc.csv", opts);

%% Convert to output type
t = tbl.t;
r = tbl.r;

%% Clear temporary variables
clear opts tbl


%% Processing


ad = 1024*r./(r+10);

figure;
plot(ad, t, 'o');

p = polyfit(ad, t, 10);
ad2 = 0:1023;
t2 = round(polyval(p, ad2), 1);
hold on; grid on; plot(ad2, t2, 'r');

dlmwrite('ntc_data.dlm', t2*10, ',');





