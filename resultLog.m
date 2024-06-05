function resultLog(newPopulation, bestFit, iteration)
    % newPopulation: yeni popülasyon (hücre dizisi)
    % bestFit: yeni popülasyonun uygunluk değerleri (double dizisi)
    
    % En iyi (minimum) fitness değerine sahip bireyi bul
    [min_fit, min_index] = min(bestFit);
    best_chromosome = newPopulation{min_index};
    % 
    % % En iyi kromozomu tek satıra dönüştür
    % best_chromosome_row = best_chromosome(:)';
    jobs = best_chromosome(1,:);
    machine = best_chromosome(2,:);
    
    
    % Min_fit değerini tek satırlık kromozomun en sağına ekle
    best_chromosome_row = [jobs, machine, min_fit];
    
    % Eğer dosya zaten varsa, mat dosyasının içeriğini yükle
    filename = 'resultlog.mat';
    if exist(filename, 'file')
        old_data = load(filename);
        old_data = old_data.data;
        data = [old_data; best_chromosome_row];
    else
        data = best_chromosome_row;
    end
    
    % Sonucu dosyaya yazdır
    save(filename, 'data');
end
