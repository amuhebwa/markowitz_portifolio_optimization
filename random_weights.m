function rand_weights = random_weights(no_of_assets)
    % Generate random weights that sum up to 1.0
    w = rand(1, no_of_assets);
    w = w/sum(w);
    rand_weights = w;