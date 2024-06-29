function EMC = calculateEMC(T, RH)
    % calculateEMC - Calculate Equilibrium Moisture Content
    %
    % Inputs:
    %   T - Temperature Celsius
    %   RH - Relative humidity (%)
    %
    % Output:
    %   EMC - Equilibrium Moisture Content (%)

    % Calculate parameters
    W = 349 + 1.29 * T + 0.0135 * T^2;
    K = 0.805 + 0.000736 * T - 0.00000273 * T^2;
    K1 = 6.27 - 0.00938 * T - 0.000303 * T^2;
    K2 = 1.91 + 0.0407 * T - 0.000293 * T^2;

    % Calculate EMC
    h = RH / 100;
    EMC = 1800 / W * (K * h / (1 - K * h) + (K1 * K * h + 2 * K1 * K2 * K^2 * h^2) / (1 + K1 * K * h + K1 * K2 * K^2 * h^2));
end