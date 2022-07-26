%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Source codes for the CTMVPS problem (version 1.0)                %
%                                                                   %
%  Developed in MATLAB R2021a                                       %
%                                                                   %
%  Author and programmer: S.D.Mourtas, C.Kasimis                    %
%                                                                   %
%   e-Mail: chrkasim@upatras.gr                                     %
%           spirosmourtas@gmail.com                                 %
%                                                                   %
%   Main paper: S.D.Mourtas, C.Kasimis, 'Exploiting Mean-Variance   %
%               Portfolio Optimization Problems through Zeroing     %
%               Neural Networks', (submitted)                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear 
close all
clc

MVPO_Setup=1;  % MVPO_Setup: 1 to 3
Example=1;     % Example: 1 to 3

[t,x]=MVPO_EX(MVPO_Setup,Example);
