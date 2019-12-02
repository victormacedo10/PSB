arquivo = 'setA\Z020.txt';

x = csvread(arquivo);
fs = 173.61; 
caracteristicas = extract_eeg_features(x, fs);

classe = svmclassify(svm, caracteristicas);

if(classe == 1)
	disp('A');
else
	disp('C');
end
