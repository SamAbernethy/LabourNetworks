function probabilityvsvariable(inputnodes, whichone, bins, mytitle)
    figure
    histogram(inputnodes(:,whichone), bins, 'Normalization','probability')
    %set(gca, 'YScale', 'log')
    xlabel('Node Strength')
    ylabel('Probability')
    title(mytitle)
end