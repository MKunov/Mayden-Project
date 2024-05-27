T1 = readtable('Brighton_start.csv');
T1 = T1(:, 1:23);
% T2 = readtable('NYork_middle.csv');
T3 = readtable('Brighton_end.csv');

%bigtable1 = outerjoin(T1, T2, 'Keys','MEASURE_NAME', 'MergeKeys', true);
%BigTable = outerjoin(bigtable1, T3, 'Keys','MEASURE_NAME', 'MergeKeys', true);

bigTable = outerjoin(T1, T3, 'Keys','MEASURE_NAME', 'MergeKeys', true); 
