function [PDBdata] = pdb2mat(readFile)
%% -- OUTPUT --


PDBdata.outfile = readFile;

FileID = fopen(readFile);
rawText = fread(FileID,inf,'*char');

splitLines = strread(rawText, '%s', 'delimiter', '\n');

numLines = length(splitLines);
resName    = cell(1,numLines);
comment    = cell(1,numLines);
m = 1;
for n = 1:numLines
    
    thisLine = cell2mat(splitLines(n));
    
    if length(thisLine) > 53 && sum(isstrprop(thisLine(23:53), 'alpha')) == 0
        
        resName(m)    = {thisLine(18:20)};
        comment(m)    = {thisLine(55:end)};
        m = m + 1;
    end
    
end
    thisLine = sprintf('%-26s',cell2mat(comment(n)));

PDBdata.resName    = strtrim(resName);
fclose(FileID);



end