number_of_assets = 4;
number_of_observations = 10000;
return_vector = rand(number_of_assets,number_of_observations);
samples = 1000;
expected_returns = zeros(samples, 1);
standarddeviations = zeros(samples, 1);
for i  = 1 : samples
    [mean_, stdiviation] = random_portifolio(return_vector);
    expected_returns(i) = mean_;
    standarddeviations(i) = stdiviation;
   
end
%plot the scatter plot of the bullet cv
%scatter(standarddeviations, expected_returns, 'filled');
%xlabel('Volatility')
%ylabel('Expected Returns')

lb = [0.2;0.2; 0.2;0.2];
ub = [0.5;0.5;0.5;0.5];
%e = mean(return_vector, 2);

covariance_matrix = create_covariance_matrix(return_vector, number_of_assets);

flipped_returns = vec2mat(return_vector, number_of_assets);

erx = zeros(samples, 1);
stdx = zeros(samples, 1);
for row = 1 : samples
    e = flipped_returns(row,:);
    wghts = efficient_weights(e, lb, ub); %Efficient Weights
    [meanxx, stdiviationxx] = efficient_portifolio(e, wghts', covariance_matrix);
    erx(row) = meanxx;
    stdx(row) = stdiviationxx;
    %meanxx
    %stdiviationxx
end
% plot the scatter plot of the bullet cv
scatter(stdx, erx);
%xlabel('Volatility')
%ylabel('Expected Returns')