function optimal_weights = efficient_weights(e, lb, ub)
    xinf = lb;
    [zz,ii] = sort(-e);
    amtleft = 1 - sum(xinf);
    ix = 1;
    while amtleft > 0
        i = ii(ix);
        chg = min((ub(i)-lb(i)),amtleft);
        xinf(i) = xinf(i) + chg;
        amtleft = amtleft-chg;
        ix = ix+1;
    end
    optimal_weights = xinf;
end
