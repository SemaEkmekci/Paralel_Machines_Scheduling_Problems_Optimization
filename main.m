% Dosya yolunu belirtin
dosya_yolu = 'test/a.txt';
  
% p ve s değerlerini dosyadan oku
[p, s, is_sayisi, makine_sayisi] = readFile(dosya_yolu);

% Çaprazlama olasılığı ve çaprazlama noktası için parametreler 
pcross = 1; 
d = 250; % İş sayısı veya kromozom boyutu
pmutation = 0.2; % Mutasyon olasılığı
as = 1;
num_jobs = is_sayisi;
num_machines = makine_sayisi;
p_size = 20;
iteration_size=10000;
% Genetik algoritmayı çalıştır
    % Popülasyonu oluşturun
    population = initializePopulation(as, num_jobs, num_machines, p_size);
    
    
    objectiveValues = objective_function(population, s, p, p_size);
    [neWpopulation, objectiveValues, old_elit_value] = ga(population ,objectiveValues, num_machines, p_size, s, p, pcross, d, pmutation, 1);

for i = 2:iteration_size  
    [neWpopulation, objectiveValues, old_elit_value] = ga(neWpopulation ,objectiveValues, num_machines, p_size, s, p, pcross, d, pmutation, i, old_elit_value);
end
% İlk oluşturulan popülasyonu göster
fprintf("İlk oluşturulan popülasyon:\n");
for i = 1:10
    fprintf("%d. kromozom: \n", i);
    disp(population{i});
    fprintf("Bu kromozomun amaç fonksiyonu değeri = %f\n", objectiveValues(i));
    fprintf("----------------------------------------------------\n");
end

fprintf("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");





