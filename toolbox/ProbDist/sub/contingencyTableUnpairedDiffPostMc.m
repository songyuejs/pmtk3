function [deltas, post, thetas] = contingencyTableUnpairedDiffPostMc(n1,y1,n2,y2)
% Unpaired contingency table
% PMTKneedsStatsToolbox ksdensity
%%
S = 10000;
alphas = [0.5 0.5];
theta1 = betaSample(struct('a',y1+alphas(1),'b',n1-y1+alphas(2)),S);
theta2 = betaSample(struct('a',y2+alphas(1),'b',n2-y2+alphas(2)),S);
diff = theta1-theta2;
[post, deltas] = ksdensity(diff);
thetas = [theta1 theta2];
end