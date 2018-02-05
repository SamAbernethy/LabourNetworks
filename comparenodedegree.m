function comparenodedegree(germanynodes, irelandnodes)
    figure
    scatter(germanynodes(:,2), irelandnodes(:,2))
    xlabel('Node Strength in Germany')
    ylabel('Node Strength in Ireland')
end