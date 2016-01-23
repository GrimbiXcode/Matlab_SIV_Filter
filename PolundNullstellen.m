%******************************************************************************
% Project     : Analyse von Pol und Nullstellen in der Signalverarbeitung
% Autor       : David Grimbichler
% Filename    : PolundNullstellen.m
% Startdate   : 21.01.2016
% Enddate     : dd.mm.yy
% Version     : 1.0
%******************************************************************************
% Analyse von Pol und Nullstellen verschiedener Filter der Signalverarbeitung
% 
% Ausgabe:
% - Bodeplot
% - 
%
%******************************************************************************
% Parameter:          -
%******************************************************************************
% global variables:   - 
%******************************************************************************
clc; close all; clear all; close all hidden;
% s = tf('s') specifies the transfer function H(s) = s (Laplace variable).
s=tf('s');

%*************************************************
% Einstellung des Filters
%*************************************************

%---------------------------------------
% Tiefpass mit qp=Güte, wp=Polfrequenz 
%---------------------------------------
qp=1.3;
wp=1e3;
k=1;
T=(k*wp+s^2)*s/(s^2+wp/qp*s+wp^2+s^3 +(s^4)/wp);

%---------------------------------------
% Butterworthtiefpass mit Filtergrad n und wdB-Frequenz
%---------------------------------------
% n=3;
% wdB=2*pi*10e6;
% T=1/(1+((s)/wdB)^(n));

%---------------------------------------
% Butterworthhochpass mit Filtergrad n und wdB-Frequenz
%---------------------------------------
% n=1;
% wdB=2*pi*10e6;
% T=((s)/wdB)^(n)/(1+((s)/wdB)^(n));

%---------------------------------------
% Butterworthhochpass mit Filtergrad n und wdB-Frequenz
% und 2 Polstellen
%---------------------------------------
% n=1;
% wdB=1;
% T=((s)/wdB)^(2*n)/(1+(s/wdB)+((s)/wdB)^(2*n));

%*************************************************
% Auswertung des Filters
%*************************************************

figure('Name','Pol und Nullstellen von Filtern','NumberTitle','off',...          %Benennt Figure als T-Glied und macht den Fenster Name "Figure 1:" unsichtbar  
    'Units','normalized','Position',[0.1 0.1 0.75 0.75]); %Setzt die Position und Grösse der Figure

% Bodediagramm
subplot(2,2,1);
bode(T);
grid on

% Pole und Nullstellen
subplot(2,2,2);
hold on;
plot(pole(T), 'x');
plot(zero(T), 'o');
grid on;
hold off;
title('Pole und Nullstellen');

% Schrittantwort
subplot(2,2,3);
step(T);
grid on;
