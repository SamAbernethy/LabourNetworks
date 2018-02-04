function A = adjacencymatrix(country, typeofmatrix)

% type of matrix means either 'degree' (1) or 'strength' (2)

germany = csvread('gerEdges.csv',1,0);
ireland = csvread('ireEdges.csv',1,0);
nodes = unique([germany(:,1); ireland(:,1); germany(:,2); ireland(:,2)]);
germany(any(germany<0,2),:) = [];
ireland(any(ireland<0,2),:) = [];

N = length(nodes);
A = zeros(N,N);

if country == 'Germany'
    for i=1:N
        for j=1:N
            for k=1:length(germany)
                if germany(k,1) == nodes(i) && germany(k,2) == nodes(j)
                    if typeofmatrix == 1
                        A(i,j) = 1;
                    end
                    if typeofmatrix == 2
                        A(i,j) = germany(k,3);
                    end
                end
            end
        end
    end

elseif country == 'Ireland'
    for i=1:N
        for j=1:N
            for k=1:length(ireland)
                if ireland(k,1) == nodes(i) && ireland(k,2) == nodes(j)
                    if typeofmatrix == 1
                        A(i,j) = 1;
                    end
                    if typeofmatrix == 2
                        A(i,j) = ireland(k,3);
                    end
                end
            end
        end
    end
else
    print('You Fail. Give me a better country please.')
end
end

