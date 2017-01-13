function [mean_, stdiviation] = efficient_portifolio(returns, wghts, cov_mtrix)
    p = returns';
    wghts = wghts;
    %cov_mat = cov_mtrix;
    mu = wghts * p;
    stdDeviation = sqrt(wghts * cov_mtrix * wghts');
    if stdDeviation > 2
        [mu, stdDeviation] = efficient_portifolio(returns, wghts, cov_mtrix);
    end
    mean_ = mu;
    stdiviation = stdDeviation;
end
