function [table, index] = mapConf(key, table)

    % no table is given -> create table
    if nargin<2
        table = {};
    end
    
    % searsh key
    TF = strcmp(key,table);
    index = find(TF);
    
    % key not found -> add key to the table
    if isempty(index)
        table{end+1} = key;
        index = length(table);
    end
    
end