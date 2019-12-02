clear all; close all; clc

try
	load('comparison_A_C');
	nbins = round(0.005 * number_tests);
	[h, n] = hist(percentage_errors_training, nbins);
	plot(n, h)
	xlabel('Percentagens de erros para entradas de treinamento')
	ylabel(['Número de ocorrências em ' num2str(number_tests) 'testes']);
	figure;
	[h, n] = hist(percentage_errors_validation, nbins);
	plot(n, h)
	xlabel('Percentagens de erros para entradas de treinamento')
	ylabel(['Número de ocorrências em ' num2str(number_tests) 'testes']);
catch
number_tests = 1000;

fid = fopen('all_features.mat', 'r');
if(fid == -1)
	[features_A, features_B, features_C, features_D, features_E] = ...
	features_all_available_signals();
else
	fclose(fid);
	load('all_features', 'features_A', ...
	'features_B', 'features_C', 'features_D', 'features_E');
end

for(n = 1 : number_tests)
[svm{n}, outputs_training{n}, outputs_validation{n}, ...
features_training{n}, correct_classes_training{n}, ...
features_validation{n}, correct_classes_validation{n}] = ...
experiment_classification_eeg_two_classes(0.8, features_A, features_C);

errors_training{n} = outputs_training{n} - correct_classes_training{n};
n_training(n) = length(errors_training{n});
errors_validation{n} = outputs_validation{n} - correct_classes_validation{n};
n_validation(n) = length(errors_validation{n});
percentage_errors_training(n) = ...
sum(abs(errors_training{n}))/n_training(n) * 100;
percentage_errors_validation(n) = ...
sum(abs(errors_validation{n}))/n_validation(n) * 100;
if(mod(n, 100) == 0)
	disp(n);
end
end

nbins = round(0.005 * number_tests);
[h, n] = hist(percentage_errors_training, nbins);
plot(n, h)
figure;
[h, n] = hist(percentage_errors_validation, nbins);
plot(n, h)

save('comparison_A_C');
end
