function scatterdegree(inputnodes, mytitle)
    figure
    scatter(inputnodes(:,3), inputnodes(:,2))
    xlabel('Degree')
    ylabel('Weighted Node Strength')
    title(mytitle)
end