function[skladlancucha]=licznikamino(readfile)
wyciagzpdb=pdb2mat2(readfile);
formatpdb=wyciagzpdb.resName;
sklad={'ALA','Alanina',0 ;'CYS','Cysteina',0 ;'ASP','Kwas asparaginowy',0 ;'GLU','Kwas glutaminowy',0 ;'PHE','Fenyloalanina',0 ;'GLY','Glicyna',0 ;'HIS','Histydyna', 0 ;'ILE','Izoleucyna', 0 ;'LYS','Lizyna', 0 ;'LEU','Leucyna', 0 ;'MET','Metionina',0 ;'ASN','Asparagina',0 ;'PRO','Prolina',0 ;'GLN','Glutamina',0 ; 'ARG','Arginina',0;'SER','Seryna',0;'THR','Treonina',0;'VAL','Walina',0;'TRP','Tryptofan',0;'TYR','Tyrozyna',0};
nazwyPol= {'name','fullname', 'value'};
skladlancucha=cell2struct(sklad,nazwyPol,2);
wielkosc=size(formatpdb);
dlugosc=wielkosc(2);


for i=1:dlugosc
    for n=1:20;
        if  formatpdb{i}==skladlancucha(n).name
            skladlancucha(n).value=skladlancucha(n).value + 1 ;
        end
    end
end
end
            