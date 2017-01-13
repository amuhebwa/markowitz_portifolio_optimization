function covmatrix = create_covariance_matrix( return_vector, number_of_assets )
    cov_mat = vec2mat(return_vector, number_of_assets);
    covmatrix = cov(cov_mat);
end

