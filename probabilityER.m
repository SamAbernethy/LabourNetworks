function probabilityER(inputnodes, whichone, bins)
figure
histogram(inputnodes(:,whichone), bins, 'Normalization','probability')
%set(gca, 'YScale', 'log')
xlabel('Degree')
ylabel('Probability ER model')
title('Germany')
hold on
M=length(inputnodes(:,whichone));
kmean=mean(inputnodes(:,whichone));
q=kmean/(M-1);
Y = binopdf(inputnodes(:,whichone),M,q);
plot(inputnodes(:,whichone),Y,'+');
end