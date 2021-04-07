function Pressure = fullbeam3D_looped(TPoints,FPoints,Freq,SVect,Speed,Density)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Title:          3D Beam Profiler - Looped version - CW
%   Description:    Calculates pressure across an arbitrary field from an
%                   arbitary surface with pulsed excitation
%   
%
%   Inputs:         TPoints -   matrix of transducer points
%                               [x1 y1 z1; x2 y2 z2 ... ]
%                   FPoints -   matrix of field points
%                               [x1 y1 z1; x2 y2 z2 ... ]
%                   Freq    -   frequencies
%                   SVect   -   vector of steering (complex)
%                               mag and phase and convert to real and imag for
%                               each Tx point
%                   Speed   -   velocity in medium
%                   Density -   rho in medium
%
%   Outputs:        PMat    -   matrix of pressures at field points                                                           
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Step 1 : Allocate variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Get lengths of inputs
numberOfTPoints = size(TPoints,1);
numberOfFPoints = size(FPoints,1);

% Preallocate pressure vector
Pressure = zeros(numberOfFPoints,1);

% Define K
K = 2 * pi * Freq / Speed;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Step 2 : Perform calculation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% Create waitbar
% h = waitbar(0,'Please wait...');


% Loop through field points
for index = 1 : numberOfFPoints
    
    % Get vector of nth field point
    FMat = repmat(FPoints(index,:), numberOfTPoints, 1);
    % Calculate Radius
    Radius = ((FMat(:,1) - TPoints(:,1)).^2 + (FMat(:,2) - TPoints(:,2)).^2 + (FMat(:,3) - TPoints(:,3)).^2).^0.5;
    % Get pressure
    PressureVect = ((Density*Freq)/numberOfTPoints) .* abs(SVect) .* exp(i * (-K .* Radius + angle(SVect))) ./ (2 * pi * Radius);
    
    % Sum pressure contributions
    Pressure(index,:) = sum(PressureVect);
    
    % Increment waitbar
    %waitbar(index/numberOfFPoints, h);

end


% Close waitbar
% close(h);