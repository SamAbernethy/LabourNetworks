function [germean, iremean, gerstrength, irestrength] = averagedegreeandstrength(germanynodes, irelandnodes)

germean = mean(germanynodes(:,3));
iremean = mean(irelandnodes(:,3));
gerstrength = mean(germanynodes(:,2));
irestrength = mean(irelandnodes(:,2));

end