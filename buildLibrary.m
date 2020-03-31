%TODO: add projectile info to decay and reaction table

%function loads all relevant isotopes for irradiation

%Note: "reaction" describes an interaction between the target and the
%projectile, as opposed to decay, which is the target interacting with
%itself
function [success, elementNameTable, isotopeTable] = buildLibrary(...
    targetElements, projectile, energy, reactionDepth)

    folderName = 'elementLibEntries';
    
    %%
    %sanity checks
    if (isempty(targetElements))
        error('No target information')
    end
    targetElements = unique(targetElements);
    if (isempty(projectile))
        error('No projectile information')
    end
    if (length(projectile) > 1) 
        error('Projectile can only be one particle type')
    end
    if (energy == 0)
        error('Projectile energy can''t be 0')
    end
    
    %%
    %load table with atomic numbers and element names
    elementNameTable = getElementNames();
    
    %assemble names of necessary initial elements
    funNames = strcat('libEntry', targetElements);
    
    %natural target assembly (collect data from each libEntry)
    isotopeTable = table();
    
    for i = 1:length(funNames)
        cd(folderName)
        %collect values
        newElementInfo = eval(cell2mat(funNames(i)));
        newElementNumber = table2array(elementNameTable(ismember(...
            elementNameTable.elementList, targetElements(i)),1));
        %append to table
        newEntries = [table(repmat(newElementNumber,height(newElementInfo),1), 'VariableNames', ...
            {'element'}), newElementInfo];
        isotopeTable = [isotopeTable;newEntries];
        cd('..')
    end
    %convert daughterElement to numbers
    
    
    %for each isotope in list, find decay daughters and reaction cross
    %sections
    
    %collect all new isotopes and add to list
    
    %repeat until reactionDepth is reached for both decay and reactions
    %%
    isotopeTable = 5;
    
    success = 1;
    
end
