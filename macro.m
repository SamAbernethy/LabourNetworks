% Sam Abernethy Feb 1
% https://arxiv.org/pdf/0704.0686.pdf
% out vs in is an interesting distinction!
% https://arxiv.org/pdf/0704.1867.pdf fitting power laws

clear all; clc; close all;

% read in data and remove negative values
germany = csvread('gerEdges.csv',1,0);
ireland = csvread('ireEdges.csv',1,0);
nodes = unique([germany(:,1); ireland(:,1); germany(:,2); ireland(:,2)]);
germany(any(germany<0,2),:) = [];
ireland(any(ireland<0,2),:) = [];

N = length(nodes);

germanynodes(:,1) = nodes;
germanynodes(:,2:7) = zeros(N,6);
M = length(germany);

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

irelandnodes(:,1) = nodes;
irelandnodes(:,2:7) = zeros(N,6);
M2 = length(ireland);

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

fprintf('Germany Average Degree: %.2f \n', mean(germanynodes(:,3)))
fprintf('Germany Average Node Strength: %.2f \n', mean(germanynodes(:,2)))

scatterdegree(germanynodes)
plotacdf(germanynodes)
probabilityvsvariable(germanynodes, 2, 20)

fprintf('Ireland Average Degree: %.2f \n', mean(irelandnodes(:,3)))
fprintf('Ireland Average Node Strength: %.2f \n', mean(irelandnodes(:,2)))

scatterdegree(irelandnodes)
title('Ireland')
plotacdf(irelandnodes)
title('Ireland')
probabilityvsvariable(irelandnodes, 2, 20)
title('Ireland')

figure
scatter(germanynodes(:,2), irelandnodes(:,2))
xlabel('Node Strength in Germany')
ylabel('Node Strength in Ireland')

figure
scatter(germanynodes(:,3), irelandnodes(:,3))
xlabel('Degree in Germany')
ylabel('Degree in Ireland')

function probabilityvsvariable(inputnodes, whichone, bins)
figure
histogram(inputnodes(:,whichone), bins, 'Normalization','probability')
%set(gca, 'YScale', 'log')
xlabel('Node Strength')
ylabel('Probability')
title('Germany')
end

function scatterdegree(inputnodes)
figure
scatter(inputnodes(:,3), inputnodes(:,2))
xlabel('Degree')
ylabel('Weighted Node Strength')
title('Germany')
end

function plotacdf(inputnodes)
figure
cdfplot(inputnodes(:,2))
set(gca, 'YScale', 'log')
set(gca, 'XScale', 'log')
xlabel('Node Strength')
ylabel('CDF')
title('Germany')
end
