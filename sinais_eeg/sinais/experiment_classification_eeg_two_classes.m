function ...
[svm, outputs_training, outputs_validation, ...
features_training, correct_classes_training, ...
features_validation, correct_classes_validation] = ...
experiment_classification_eeg_two_classes ...
(alpha, features_positive, features_negative);

r = randperm(size(features_positive, 1));
n = round(alpha * size(features_positive, 1));
m = size(features_positive, 1) - n;
rows_training = r(1 : n);
rows_validation = r(n + 1 : end);

features_training = [features_positive(rows_training, :); ...
                     features_negative(rows_training, :)];
correct_classes_training = [ones(n, 1); zeros(n, 1)];

features_validation = [features_positive(rows_validation, :); ...
                       features_negative(rows_validation, :)];
correct_classes_validation = [ones(m, 1); zeros(m, 1)];

svm = svmtrain(features_training, correct_classes_training);
outputs_training = svmclassify(svm, features_training);
outputs_validation = svmclassify(svm, features_validation);
