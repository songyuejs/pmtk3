function kmeansDemoFaithful

close all
X = load('faithful.txt');
X = standardizeCols(X);
figure; plot(X(:,1), X(:,2), '.', 'markersize', 10)
title('old faithful data')
grid on
printPmtkFigure('faithful'); 

% specify initial params to make for a pretty plot
mu = [-1.5 1.5; 1.5 -1.5]';
seed = 4; rand('state', seed); randn('state', seed);
K = 2;
[mu, assign, errHist] = kmeansSimple(X, K, 'plotfn', @plotKmeans, ...
   'maxIter', 10, 'mu', mu);
end

%%%%%%

function plotKmeans(data, mu, assign, err, iter)

fprintf('iteration %d, error %5.4f\n', iter, err);
mu
[K D] = size(mu);
figure;
symbols = {'r.', 'gx', 'b', 'k'};
for k=1:K
  %subplot(2,2,iter)
  members = find(assign==k);
  plot(data(members,1), data(members, 2), symbols{k}, 'markersize', 10);
  hold on
  plot(mu(1,k), mu(2,k), sprintf('%sx', 'k'), 'markersize', 14, 'linewidth', 3)
  grid on
end
title(sprintf('iteration %d, error %5.4f', iter, err))
if iter==2, printPmtkFigure('kmeansDemoFaithfulIter2'); end

end