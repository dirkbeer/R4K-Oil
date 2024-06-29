close all
clear all

global redgreen_cm

redgreen_cm = [
    0.5784    0.9142    0.4706
    0.5841    0.9047    0.4581
    0.5895    0.8951    0.4457
    0.5947    0.8856    0.4335
    0.5997    0.8761    0.4214
    0.6045    0.8666    0.4095
    0.6091    0.8572    0.3978
    0.6135    0.8477    0.3863
    0.6177    0.8383    0.3749
    0.6217    0.8290    0.3636
    0.6256    0.8196    0.3526
    0.6292    0.8103    0.3417
    0.6326    0.8010    0.3309
    0.6359    0.7917    0.3204
    0.6390    0.7825    0.3099
    0.6419    0.7733    0.2997
    0.6446    0.7641    0.2895
    0.6472    0.7550    0.2796
    0.6496    0.7459    0.2698
    0.6518    0.7368    0.2601
    0.6538    0.7278    0.2507
    0.6557    0.7188    0.2413
    0.6574    0.7099    0.2321
    0.6590    0.7009    0.2231
    0.6604    0.6921    0.2142
    0.6616    0.6832    0.2055
    0.6627    0.6744    0.1969
    0.6636    0.6657    0.1885
    0.6644    0.6569    0.1803
    0.6650    0.6483    0.1722
    0.6654    0.6396    0.1643
    0.6658    0.6310    0.1565
    0.6659    0.6225    0.1489
    0.6660    0.6140    0.1415
    0.6659    0.6055    0.1342
    0.6656    0.5971    0.1272
    0.6652    0.5888    0.1203
    0.6647    0.5804    0.1136
    0.6640    0.5722    0.1071
    0.6632    0.5640    0.1009
    0.6623    0.5558    0.0949
    0.6612    0.5477    0.0891
    0.6600    0.5396    0.0836
    0.6587    0.5316    0.0784
    0.6572    0.5236    0.0735
    0.6557    0.5157    0.0690
    0.6540    0.5079    0.0648
    0.6521    0.5001    0.0609
    0.6502    0.4923    0.0575
    0.6481    0.4846    0.0545
    0.6460    0.4769    0.0520
    0.6437    0.4694    0.0499
    0.6413    0.4618    0.0483
    0.6388    0.4543    0.0472
    0.6361    0.4469    0.0466
    0.6334    0.4395    0.0464
    0.6306    0.4322    0.0466
    0.6276    0.4249    0.0473
    0.6246    0.4177    0.0483
    0.6214    0.4106    0.0497
    0.6182    0.4035    0.0514
    0.6148    0.3964    0.0533
    0.6114    0.3894    0.0555
    0.6078    0.3825    0.0578
    0.6042    0.3756    0.0603
    0.6005    0.3688    0.0629
    0.5966    0.3620    0.0656
    0.5927    0.3553    0.0685
    0.5887    0.3486    0.0713
    0.5847    0.3420    0.0742
    0.5805    0.3354    0.0771
    0.5762    0.3289    0.0801
    0.5719    0.3224    0.0830
    0.5675    0.3160    0.0860
    0.5630    0.3096    0.0889
    0.5585    0.3033    0.0918
    0.5538    0.2970    0.0947
    0.5491    0.2908    0.0975
    0.5444    0.2846    0.1003
    0.5395    0.2784    0.1030
    0.5346    0.2723    0.1057
    0.5296    0.2662    0.1084
    0.5246    0.2602    0.1109
    0.5195    0.2542    0.1135
    0.5143    0.2482    0.1159
    0.5091    0.2423    0.1183
    0.5038    0.2363    0.1207
    0.4985    0.2305    0.1229
    0.4931    0.2246    0.1251
    0.4876    0.2187    0.1273
    0.4821    0.2129    0.1293
    0.4766    0.2071    0.1313
    0.4710    0.2013    0.1332
    0.4653    0.1955    0.1351
    0.4596    0.1896    0.1368
    0.4539    0.1838    0.1385
    0.4481    0.1780    0.1401
    0.4422    0.1722    0.1416
    0.4363    0.1663    0.1430
    0.4304    0.1604    0.1444];

function create_spider_plot(PI, DM, EMC)
    % Create a spider plot using PI, DM, and EMC values
    % Input:
    %   PI  - Preservation Index
    %   DM  - Days to Mold
    %   EMC - Equilibrium Moisture Content
    
    % Combine input values into one matrix
    data = [PI./382, DM./165, EMC./29.1];
    
    % Define the labels for the axes
    labels = {'Preservation Index', 'Days to Mold', 'Equilibrium Moisture Content'};
    
    % Number of variables
    num_vars = length(data);
    
    % Angles for each axis
    theta = linspace(0, 2*pi, num_vars + 1);
    
    % Repeat data to close the plot
    data = [data, data(1)];
    
    % Create the polar plot
    figure;
    polarplot(theta, data, '-o');
    
    % Add labels to the axes
    ax = gca;
    ax.ThetaTick = rad2deg(theta);
    ax.ThetaTickLabel = labels;
    
    % Title and formatting
    title('Spider Plot of PI, DM, and EMC Values');
    set(gca, 'FontSize', 12);
    ax.ThetaLim = [0 360];
    ax.RLim = [0 max(data)];
    grid on
end

function plot_risk_matrix(risk_name, RH_values, T_values, risk_matrix)
    global redgreen_cm
    figure;
    imagesc(RH_values, T_values, risk_matrix);
    colorbar;
    clim([1 3]); % Set the color axis limits
    %colormap([0 1 0; 1 1 0; 1 0 0]); % Green for 'GOOD', Yellow for 'OK', Red for 'RISK'
    colormap([redgreen_cm(1,:);redgreen_cm(50,:); redgreen_cm(100,:)]); % Green for 'GOOD', Yellow for 'OK', Red for 'RISK'
    xlabel('Relative Humidity (%)');
    ylabel('Temperature (°C)');
    title([risk_name,' Damage Rating']);
    set(gca, 'YDir', 'normal'); % Correct the Y-axis direction
    grid on
    
    % Add a colorbar with labels for corrosion ratings
    c = colorbar;
    c.Ticks = [1, 2, 3];
    c.TickLabels = {'GOOD', 'OK', 'RISK'};
end

function plot_index_matrix(index_name, RH_values, T_values, index_matrix)
    global redgreen_cm
    figure;
    imagesc(RH_values, T_values, index_matrix);
    colorbar;
    %colormap("parula");
    colormap(redgreen_cm);
    xlabel('Relative Humidity (%)');
    ylabel('Temperature (°C)');
    title(index_name);
    set(gca, 'YDir', 'normal'); % Correct the Y-axis direction
    c = colorbar;
    c.Label.String = index_name;
end

% Test Cases
test_cases = [
    25, 60;
    10, 30;
    40, 80;
    100, 95;
    0, 50;
    50, 10;
    30, 70;
    20, 90;
    95, 65;
    5, 40
];

% Run Test Cases
for i = 1:size(test_cases, 1)
    T = test_cases(i, 1);
    RH = test_cases(i, 2);
    
    [PI, chem_rating] = preservation_index(T, RH);
    [DM, mold_rating] = days_to_mold(T, RH);
    [EMC, mech_rating, corr_rating] = equilibrium_moisture_content(T, RH);
    [T, RH, EMC, calculateEMC(T, RH)]
    % fprintf('Test Case %d:\n', i);
    % fprintf('  T = %d, RH = %d\n', T, RH);
    % fprintf('  Preservation Index: %f\n', PI);
    % fprintf('  Chemical Aging Risk: %s\n', chem_rating);
    % fprintf('  Days to Mold: %f\n', DM);
    % fprintf('  Mold Risk: %s\n', mold_rating);
    % fprintf('  Equilibrium Moisture Content: %f\n', EMC);
    % fprintf('  Mechanical Damage Rating: %s\n', mech_rating);
    % fprintf('  Metal Corrosion Rating: %s\n', corr_rating);
    % fprintf('\n');
end

% Define the range of Temperature and Relative Humidity values
T_values = -20:65; % Temperature from -20 to 65 degrees Celsius
RH_values = 6:95; % Relative Humidity from 0% to 100%

% Initialize matrices to store the corrosion ratings and EMC values
mechanical_matrix = zeros(length(T_values), length(RH_values));
corrosion_matrix = zeros(length(T_values), length(RH_values));
mold_matrix = zeros(length(T_values), length(RH_values));
chem_matrix = zeros(length(T_values), length(RH_values));

emc_matrix = zeros(length(T_values), length(RH_values));
pi_matrix = zeros(length(T_values), length(RH_values));
dm_matrix = zeros(length(T_values), length(RH_values));

% Loop through all combinations of T and RH
for i = 1:length(T_values)
    for j = 1:length(RH_values)
        T = T_values(i);
        RH = RH_values(j);
        
        % Calculate Equilibrium Moisture Content and Corrosion Rating
        [EMC, mech_rating, corr_rating] = equilibrium_moisture_content(T, RH);
        [PI, chem_rating] = preservation_index(T, RH);
        [DM, mold_rating] = days_to_mold(T, RH);

        %create_spider_plot(PI, DM, EMC);
        
        % Store the EMC value
        emc_matrix(i, j) = EMC;
        pi_matrix(i, j) = PI;
        dm_matrix(i, j) = DM;
        
        % Convert corrosion rating to numerical values for plotting
        switch corr_rating
            case 'GOOD'
                corrosion_matrix(i, j) = 1; % Good rating
            case 'OK'
                corrosion_matrix(i, j) = 2; % OK rating
            case 'RISK'
                corrosion_matrix(i, j) = 3; % Risk rating
        end
        switch mech_rating
            case 'OK'
                mechanical_matrix(i, j) = 1; % OK rating
            case 'RISK'
                mechanical_matrix(i, j) = 3; % Risk rating
        end
        switch mold_rating
            case 'GOOD'
                mold_matrix(i, j) = 1; % Good rating
            case 'RISK'
                mold_matrix(i, j) = 3; % Risk rating
        end
        switch chem_rating
            case 'GOOD'
                chem_matrix(i, j) = 1; % Good rating
            case 'OK'
                chem_matrix(i, j) = 2; % OK rating
            case 'RISK'
                chem_matrix(i, j) = 3; % Risk rating
        end
    end
end

plot_index_matrix('EMC%', RH_values, T_values, emc_matrix)
plot_index_matrix('Preservation Index', RH_values, T_values, pi_matrix)

dm_matrix(dm_matrix==0) = max(dm_matrix(:));
plot_index_matrix('Days to Mold', RH_values, T_values, dm_matrix)

plot_risk_matrix('Corrosion', RH_values, T_values, corrosion_matrix)
plot_risk_matrix('Mechanical', RH_values, T_values, mechanical_matrix)
plot_risk_matrix('Mold', RH_values, T_values, mold_matrix)
plot_risk_matrix('Chemical', RH_values, T_values, chem_matrix)

matrices = cat(3, mechanical_matrix, corrosion_matrix, mold_matrix, chem_matrix);
worst_case_matrix = max(matrices, [], 3);
average_case_matrix = (mechanical_matrix + corrosion_matrix + mold_matrix + chem_matrix)./4;

plot_risk_matrix('Worst Case', RH_values, T_values, worst_case_matrix)
plot_index_matrix('Average', RH_values, T_values, average_case_matrix)