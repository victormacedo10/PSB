function [waves, filters_designed, prefilter_designed] = ...
extract_eeg_waves(x, fs, frequency_bands, visualize, lowpass_fc);

max_eeg_freq = 40;

if(nargin < 5)
	lowpass_fc = max_eeg_freq;
end

if(nargin < 4)
	visualize = 0;
end

if(nargin < 3 | size(frequency_bands, 1) == 0)
	frequency_bands = [...
	0 3.8; % delta
	4 7.8; % theta
	8 15.8; % alpha
	16 31.8; % beta
	32 max_eeg_freq]; % gamma
end

frequency_bands = frequency_bands / fs;

prefilter_designed = 0;
if(length(lowpass_fc) > 0)
	fc = lowpass_fc / fs;
	order = 10;
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

% Obtain the desired waves
for(k = 1 : size(frequency_bands, 1))
	waves{k} = filter(num{k}, den{k}, x);
end

if(visualize)
	number_bands = size(frequency_bands, 1);
	t = 0 : length(x) - 1;
	t = t * 1/fs;
	subplot(number_bands + 1, 1, 1);
	plot(t, x);
	ylabel('x(t)');
	xlabel('Tempo em segundos');
	for(k = 1 : number_bands)
		subplot(number_bands + 1, 1, k + 1);
		plot(t, waves{k});
		ylabel(['w_' num2str(k) 't']);
		xlabel('Tempo em segundos');
	end
end
