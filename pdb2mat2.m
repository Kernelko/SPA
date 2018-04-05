
function [PDBdata] = pdb2mat2(readFile)
%% -- OUTPUT --
PDBdata.outfile = readFile;
% initialize file
FileID = fopen(readFile);
rawText = fread(FileID,inf,'*char');

% parse lines by end-of-lines
splitLines = strread(rawText, '%s', 'delimiter', '\n');

% initialize variables
numLines = length(splitLines);

recordName = cell(1,numLines);
resName    = cell(1,numLines);

% read each line
m = 1;
for n = 1:numLines
    
    thisLine = cell2mat(splitLines(n));
    
    if length(thisLine) > 53 && sum(isstrprop(thisLine(23:53), 'alpha')) == 0
        
        recordName(m) = {thisLine(1:6)};
        resName(m)    = {thisLine(18:20)};
        
        m = m + 1;
    end
    
end

% trim exess
keepData = logical(strcmp(recordName,'ATOM  ') + strcmp(recordName,'HETATM'));

recordName = recordName(keepData);
resName    = resName(keepData);

% reformat data for convenience
PDBdata.recordName = strtrim(recordName);
PDBdata.resName    = strtrim(resName);

% close file
fclose(FileID);
end