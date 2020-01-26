% This is a MATLAB function that takes filtered back projections without .
% PR is a matrix whose columns are the projections at each angle. 
% THETA is a row vector of the angles of the respective projections.

function BackI = back(PR, THETA)

% Determine the size of the projected, PR, image
n = size(PR,1);
sideSize = n;


% * * * FILTER THE PROJECTIONS * * *

%  No Filter applied
% filtPR = PR;

%  Ramp Filter with Cutoff
filtPR = projfilter(PR);

%  Convert THETA to radians and subtract pi so the reconstructed image
%  has the same orientation
 th = pi - ((pi/180)*THETA);

%  Prepare image
 m = length(THETA); 
 BackI = zeros(sideSize,sideSize);

%  Find the middle index of the projections
 midindex = (n+1)/2;

%  Create x and y matrices
 x = 1:sideSize;
 y = 1:sideSize;
 [X,Y] = meshgrid(x,y);
 xpr = X - (sideSize+1)/2;
 ypr = Y - (sideSize+1)/2;

 for i = 1:m
    % Use the backprojection algorithm to determine which areas on the projected
    % images add up 
    filtIndex = round(midindex + xpr*sin(th(i)) - ypr*cos(th(i)));

    % While "in bounds" then add the point
    BackIa = zeros(sideSize,sideSize);
    spota = find((filtIndex > 0) & (filtIndex <= n));
    newfiltIndex = filtIndex(spota);
    BackIa(spota) = filtPR(newfiltIndex(:),i);
       
    BackI = BackI + BackIa; 
 end

BackI = BackI./m;

