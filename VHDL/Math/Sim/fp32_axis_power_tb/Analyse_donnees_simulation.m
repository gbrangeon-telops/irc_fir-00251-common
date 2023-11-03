%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Scrit d'analyse des données de simulation du module de
% compression/décompression.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;

compress_exponent = 16/23;

% Les valeurs entrées dans la simulation
fileID = fopen('D:\Telops\FIR-00251-Common\VHDL\Math\Sim\fp32_axis_power_tb\din_values.txt');
data_in = fscanf(fileID, '%u');
fclose(fileID);

% Les valeurs compressées obtenues par la simulation
fileID = fopen('D:\Telops\FIR-00251-Common\VHDL\Math\Sim\fp32_axis_power_tb\compress_values.txt');
compress_sim = fscanf(fileID, '%u');
fclose(fileID);

% Les valeurs décompressées obtenues par la simulation
fileID = fopen('D:\Telops\FIR-00251-Common\VHDL\Math\Sim\fp32_axis_power_tb\decompress_values.txt');
decompress_sim = fscanf(fileID, '%u');
fclose(fileID);

% Ajustement des longueurs de matrice si nécessaire
min_length = min([length(data_in), length(compress_sim), length(decompress_sim)]);
data_in = data_in(1:min_length);
compress_sim = compress_sim(1:min_length);
decompress_sim = decompress_sim(1:min_length);

% Calcul des valeurs compressées obtenues théoriquement
compress_th = data_in.^compress_exponent;


%% Analyse de la compression par rapport à la théorie
compress_error = compress_sim - compress_th;
max_compress_error = max(abs(compress_error));

zoom_interval = length(data_in)-500:length(data_in);
figure
subplot(2,2,1)
plot(data_in, compress_sim, data_in, compress_th)
title('Compression obtenue par simulation')
legend('simulation', 'théorie')
xlabel('Valeur d''origine [cnt 23b]')
ylabel('Valeur compressée [cnt 16b]')

subplot(2,2,2)
plot(data_in(zoom_interval), compress_sim(zoom_interval), data_in(zoom_interval), compress_th(zoom_interval))
title('Zoom compression obtenue par simulation')
legend('simulation', 'théorie')
xlabel('Valeur d''origine [cnt 23b]')
ylabel('Valeur compressée [cnt 16b]')

subplot(2,2,3)
plot(data_in, compress_error, '-o')
title(sprintf('Erreur de la simulation par rapport à la théorie\n |max| = %.4f cnt', max_compress_error))
xlabel('Valeur d''origine [cnt 23b]')
ylabel('Erreur [cnt 16b]')

subplot(2,2,4)
plot(data_in(zoom_interval), compress_error(zoom_interval), '-o')
title(sprintf('Zoom erreur de la simulation par rapport à la théorie\n |max| = %.4f cnt', max_compress_error))
xlabel('Valeur d''origine [cnt 23b]')
ylabel('Erreur [cnt 16b]')


%% Analyse de la compression/décompression par rapport aux données originales
decompress_error = decompress_sim - data_in;
max_decompress_error = max(abs(decompress_error));

zoom_interval = length(data_in)-500:length(data_in);
figure
subplot(2,2,1)
plot(data_in, decompress_sim)
title('Décompression obtenue par simulation')
xlabel('Valeur d''origine [cnt 23b]')
ylabel('Valeur décompressée [cnt 23b]')

subplot(2,2,2)
plot(data_in(zoom_interval), decompress_sim(zoom_interval))
title('Zoom décompression obtenue par simulation')
xlabel('Valeur d''origine [cnt 23b]')
ylabel('Valeur décompressée [cnt 23b]')

subplot(2,2,3)
plot(data_in, decompress_error, '-o')
title(sprintf('Erreur de la simulation par rapport à la valeur d''origine\n |max| = %d cnt', max_decompress_error))
xlabel('Valeur d''origine [cnt 23b]')
ylabel('Erreur [cnt 23b]')

subplot(2,2,4)
plot(data_in(zoom_interval), decompress_error(zoom_interval), '-o')
title(sprintf('Zoom erreur de la simulation par rapport à la valeur d''origine\n |max| = %d cnt', max_decompress_error))
xlabel('Valeur d''origine [cnt 23b]')
ylabel('Erreur [cnt 23b]')
