function [mean_, stdiviation] = random_portifolio(returns)
    [num_of_assets, no_of_observations] = size(returns); % rows and columns
    
    p = mean(returns, 2);
    wghts = random_weights(num_of_assets);
    cov_mat = vec2mat(returns, num_of_assets);
    cov_mat = cov(cov_mat);
    mu = wghts * p;
    stdDeviation = sqrt(wghts * cov_mat * vec2mat(wghts, 1));
    if stdDeviation > 2
        [mu, stdDeviation] = random_portifolio(returns);
    end
    mean_ = mu;
    stdiviation = stdDeviation;

end

