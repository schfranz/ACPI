%data file with natural abundances of Fe isotopes
%to be used as input for target creation
function [elementTable] = libEntryFe()

    %NOTE:
    %reference: Wikipedia
    %abundance of trace elements is set to zero

    element = 'Fe';
    weight = 55.845; %[u]
    density = 7.874; %[g/cm^3]

    isotopes = [54:60]';
    abundance = [5.85, 0, 91.75, 2.12, 0.28, 0, 0]'; % [%]
    halflife = [nan, 2.73*365*24*3600, nan, nan, nan, 44.6*24*3600, ...
        2.6*10^6*365*24*3600]'; %[s]
    daughterElement = {'', 'Mn', '', '', '', 'Co', 'Co'}';
    daughterIsotope = [nan, 55, nan, nan, nan, 59, 60]';

    elementTable = table(isotopes, abundance, halflife, daughterElement, ...
        daughterIsotope);

end