% This script contains some simple simulations in the style 
% described in the bitcoin paper

% consider a range of strengths for the attacker
q = 0.1:0.05:0.45 ;

% consider a range of blocks waited by the recipient
z = 0:50 ;

probs = zeros(numel(q), numel(z)) ;

for i = 1:numel(q) 
    for j = 1:numel(z)
        probs(i, j) = attackerSuccess(q(i), z(j)) ;
    end
end

% plot the results
figure ;

for i = 1:numel(q) 
    plot(z, probs(i,:)) ;
    hold on ;
end

ylim([0 1]) ;
title('Attacker success odds') ;
ylabel('Probability of attacker success') ;
xlabel('Blocks waited by recipient') ;
labels = arrayfun(@(x) sprintf('q = %.2f', x), q, 'UniformOutput', false) ;
legend(labels) ;

% save figure
print('figs/simulations', '-dpng') ;

% display in terminal
zv_dispFig ;
