clear all; close all; clc

fid = fopen('all_features.mat', 'r');
if(fid == -1)
	[features_A, features_B, features_C, features_D, features_E] = ...
	features_all_available_signals();
else
	fclose(fid);
	load('all_features', 'features_A', ...
	'features_B', 'features_C', 'features_D', 'features_E');
end

[svm, outputs_training, outputs_validation, ...
features_training, correct_classes_training, ...
features_validation, correct_classes_validation] = ...
experiment_classification_eeg_two_classes(0.8, features_A, features_C);

errors_training = outputs_training - correct_classes_training;
n_training = length(errors_training);
errors_validation = outputs_validation - correct_classes_validation;
n_validation = length(errors_validation);
percentage_errors_training = ...
sum(abs(errors_training))/n_training * 100;
percentage_errors_validation = ...
sum(abs(errors_validation))/n_validation * 100;

percentage_errors_training
percentage_errors_validation
