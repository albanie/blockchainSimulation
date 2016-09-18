function prob = attackerSuccess(q, z)
% attackerSuccess computes the probability of an 
% attacker eventually catching up in a blockhain race
%
% ARGUMENTS
%  q: = chance of attacker solving proof of work before 
%  z: = number of blocks receiver waits 
%
% the probability is computed as (latex notation):
% prob = 1 - \sum_{k=0}^z \frac{\lambda^ke^{-\lambda}}{k!}(1 - (q / p)^{(z - k)})
%
% as described in the paper
% Nakamoto, Satoshi. "Bitcoin: A peer-to-peer electronic cash system." (2008)

% compute chance of honest node solving first
p = 1 - q ;

% progress of attacker after z blocks have been completed
lambda = z * ( q / p) ;

% first term in probability equation defined above 
prob = 1 ;

for k = 0:z
    poiss = poisspdf(k, lambda) ;
    prob = prob - poiss * ( 1 - ( q / p) ^ (z - k)) ;
end
