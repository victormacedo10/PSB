function [features, filters_designed, prefilter_designed, ...
column_first_freq_feature] = ...
extract_eeg_features(x, fs, frequency_bands, ...
windows_length_sec, windows_shift_sec, window_type, ...
cutoff_frequency_low_pass_prefilter);

max_eeg_freq = 40;

if(nargin < 7)
	cutoff_frequency_low_pass_prefilter = max_eeg_freq;
end

if(nargin < 6)
	window_type = 'hamming';
end

if(nargin < 5)
	windows_shift_sec = 2;
end

if(nargin < 4)
	windows_length_sec = 4;
end

if(nargin < 3)
	% these are the standard frequency bands for the 
	% delta, theta, alpha, beta, and gamma waves.
	frequency_bands = [...
	0 3.8;
	4 7.8;
	8 15.8;
	16 31.8;
	32 max_eeg_freq];
end

windows_length = round(windows_length_sec * fs);
windows_shift = round(windows_shift_sec * fs);
N = length(x);
frequency_bands = frequency_bands / fs;

% Prefiltering
prefilter_designed = 0;
if(length(cutoff_frequency_low_pass_prefilter) > 0)
	fc = cutoff_frequency_low_pass_prefilter / fs;
	order = 8;
	stable = 0;
	while(~stable & order > 1)
		[num, den] = butter(order, 2 * fc, 'low');
		poles = roots(den);
		if(max(abs(poles)) < 1)
			stable = 1;
		else
			order = order - 1;
		end
	end
	if order == 1
		num = 1;
		den = 1;
		prefilter_designed = 0;
	else
		prefilter_designed = 1;
	end
	x = filter(num, den, x);
end

% RMS features
start_window = 1;
end_window = min([windows_length N]);
features = [];
while(start_window < N)
	rms = sqrt(sum(x(start_window : end_window) .^ 2) / ...
	(end_window - start_window));
	features = [features rms];
	start_window = start_window + windows_shift;
	end_window = end_window + windows_shift;
	end_window = min([end_window N]);
end

column_first_freq_feature = size(features, 2) + 1;

% Frequency-domain features
% Design the appropriate filters
num = {};
den = {};
filters_designed = 1;
for(n = 1 : size(frequency_bands, 1))
	fc = [frequency_bands(n, 1) frequency_bands(n, 2)];
	type_filter = 'bandpass';
	if(fc(1) == 0)
		fc = fc(2);
		type_filter = 'low';
	else
		if(fc(2) == max_eeg_freq)
			fc = fc(1);
			type_filter = 'high';
		end
	end
	order = 8;
	stable = 0;
	while(~stable & order > 1)
		[num{n}, den{n}] = butter(order, 2 * fc, type_filter);
		poles = roots(den{n});
		if(max(abs(poles)) < 1)
			stable = 1;
		else
			order = order - 1;
		end
	end
	if order == 1
		num{n} = 1;
		den{n} = 1;
		filters_designed = 0;
	end
end

% Extract features
start_window = 1;
end_window = min([windows_length N]);
while(start_window < N)
	windowed_x = x(start_window : end_window);
	w = window(window_type, length(windowed_x));
	windowed_x = w(:) .* windowed_x(:);
	for(n = 1 : length(num))
		y = filter(num{n}, den{n}, windowed_x);
		y = sum(y .^ 2) / length(y);
		features = [features y];
	end
	start_window = start_window + windows_shift;
	end_window = end_window + windows_shift;
	end_window = min([end_window N]);
end
