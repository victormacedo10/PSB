function [features_A, features_B, features_C, features_D, features_E] = ...
features_all_available_signals();

fs = 173.61;

features_A = [];
features_B = [];
features_C = [];
features_D = [];
features_E = [];

D = dir('setA\*.txt');
for(k = 1 : length(D))
	x = csvread(['setA\' D(k).name]);
	f = extract_eeg_features(x, fs);
	features_A = [features_A; f];
end

D = dir('setB\*.txt');
for(k = 1 : length(D))
	x = csvread(['setB\' D(k).name]);
	f = extract_eeg_features(x, fs);
	features_B = [features_B; f];
end

D = dir('setC\*.txt');
for(k = 1 : length(D))
	x = csvread(['setC\' D(k).name]);
	f = extract_eeg_features(x, fs);
	features_C = [features_C; f];
end

D = dir('setD\*.txt');
for(k = 1 : length(D))
	x = csvread(['setD\' D(k).name]);
	f = extract_eeg_features(x, fs);
	features_D = [features_D; f];
end

D = dir('setE\*.txt');
for(k = 1 : length(D))
	x = csvread(['setE\' D(k).name]);
	f = extract_eeg_features(x, fs);
	features_E = [features_E; f];
end

save('all_features', 'features_A', 'features_B', 'features_C', 'features_D', 'features_E');
