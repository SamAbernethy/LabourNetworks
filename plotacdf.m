function plotacdf(inputnodes, mytitle)
    figure
    cdfplot(inputnodes(:,2))
    set(gca, 'YScale', 'log')
    set(gca, 'XScale', 'log')
    xlabel('Node Strength')
    ylabel('CDF')
    title(mytitle)
end