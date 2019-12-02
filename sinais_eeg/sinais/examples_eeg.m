clear all; close all; clc

fs = 173.61;

x = csvread('setC\N001.txt');
n = 0 : length(x) - 1;
t = n * 1 / fs;
plot(t, x / max(abs(x)))
grid on;
xlabel('Tempo (segundos)');
ylabel('Sinal de eletroencefalografia (escala normalizada bipolar)');
output_file = ...
'exemplo_eeg_epiletico_intervalo_sem_convulsao_hipocampo_oposto';
axis([0 22 -1.1 1.1]);
y_horizontal = 0;
density = 600;
maxchunk = 4000;
my_matlab2tikz(output_file, y_horizontal, density, maxchunk);
close all;

x = csvread('setA\Z001.txt');
n = 0 : length(x) - 1;
t = n * 1 / fs;
plot(t, x / max(abs(x)))
grid on;
xlabel('Tempo (segundos)');
ylabel('Sinal de eletroencefalografia (escala normalizada bipolar)');
output_file = 'exemplo_eeg_saudavel';
axis([0 22 -1.1 1.1]);
y_horizontal = 0;
density = 600;
maxchunk = 4000;
my_matlab2tikz(output_file, y_horizontal, density, maxchunk);
close all
