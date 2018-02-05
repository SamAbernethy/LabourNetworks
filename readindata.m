function [germanynodes, irelandnodes, nodes] = readindata()

germany = csvread('gerEdges.csv',1,0);
ireland = csvread('ireEdges.csv',1,0);
nodes = unique([germany(:,1); ireland(:,1); germany(:,2); ireland(:,2)]);
germany(any(germany<0,2),:) = [];
ireland(any(ireland<0,2),:) = [];

N = length(nodes);
M = length(germany);
M2 = length(ireland);

germanynodes(:,1) = nodes;
germanynodes(:,2:7) = zeros(N,6);
irelandnodes(:,1) = nodes;
irelandnodes(:,2:7) = zeros(N,6);

for ii=1:N
    nodeofinterest = germanynodes(ii);
    for jj = 1:M
        if germany(jj,1) == nodeofinterest || germany(jj,2) == nodeofinterest  % outflowing
            germanynodes(ii,2) = germanynodes(ii,2)+ germany(jj,3); % both weights
            germanynodes(ii,3) = germanynodes(ii,3)+1; % basic degree out
        end
        if germany(jj,1) == nodeofinterest % outflowing
            germanynodes(ii,4) = germanynodes(ii,4)+ germany(jj,3); % weight of outgoing
            germanynodes(ii,5) = germanynodes(ii,5)+1; % basic degree out
        end
        if germany(jj,2) == nodeofinterest % inflowing
            germanynodes(ii,6) = germanynodes(ii,6) + germany(jj,3); % weight of incoming
            germanynodes(ii,7) = germanynodes(ii,7) + 1; % basic degree in
        end
    end
end

for ii=1:N
    nodeofinterest = irelandnodes(ii);
    for jj = 1:M2
        if ireland(jj,1) == nodeofinterest || ireland(jj,2) == nodeofinterest  % outflowing
            irelandnodes(ii,2) = irelandnodes(ii,2)+ ireland(jj,3); % both weights
            irelandnodes(ii,3) = irelandnodes(ii,3)+1; % basic degree out
        end
        if ireland(jj,1) == nodeofinterest % outflowing
            irelandnodes(ii,4) = irelandnodes(ii,4)+ ireland(jj,3); % weight of outgoing
            irelandnodes(ii,5) = irelandnodes(ii,5)+1; % basic degree out
        end
        if ireland(jj,2) == nodeofinterest % inflowing
            irelandnodes(ii,6) = irelandnodes(ii,6) + ireland(jj,3); % weight of incoming
            irelandnodes(ii,7) = irelandnodes(ii,7) + 1; % basic degree in
        end
    end
end

end