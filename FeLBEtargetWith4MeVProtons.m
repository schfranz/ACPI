%script that runs an activation calculation for an
%   iron-lead-bismuth target irradiated by 4 MeV protons

%set parameters
targetElements = {'Fe', 'Pb', 'Bi'};
projectile = {'H'};
energy = 4; %[MeV]
reactionDepth = 2; %search depth for nuclear reactions and decays
timeStep = 1; % [s]

%build library 
[success, elementNameTable, isotopeTable] = buildLibrary(targetElements, projectile, energy, reactionDepth);

%assemble target (loads all naturally occurring isotopes from
%   library entry
targetIsotopes = getTargetIsotopes(targetElements); %fctn that pulls isotopes from lib entries

%load reaction pathways and proton cross sections

%start calculation
