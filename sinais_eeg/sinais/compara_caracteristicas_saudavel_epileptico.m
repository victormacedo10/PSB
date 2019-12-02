clear all; close all; clc

x_saudavel = csvread('setA/Z001.txt');
x_epileptico = csvread('setC/N001.txt');
fs = 173.61;

[caracteristicas_saudavel, f1, p1, c1] = extract_eeg_features(x_saudavel, fs);
[caracteristicas_epilep, f2, p2, c2] = extract_eeg_features(x_epileptico, fs);

plot(caracteristicas_saudavel(c1), caracteristicas_saudavel(c1 + 1), 'b.', 'markersize', 20);
hold on;
plot(caracteristicas_epilep(c1), caracteristicas_epilep(c1 + 1), 'rX', 'markersize', 10);
