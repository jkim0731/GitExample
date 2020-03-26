function [p1, p2] = goldbach(n)
% The Goldbach conjecture asserts that every even integer greater than 2 can be expressed as the sum of two primes.

% Given the even integer n, return primes p1 and p2 that satisfy the condition n = p1 + p2. Note that the primes are not always unique. The test is not sensitive to order or uniqueness. You just need to meet the appropriate conditions.
% Example: 
% Input  n = 286
% Output (any of the following is acceptable) 
%        [  3 283]
%        [283   3]
%        [  5 281]
%        [107 179]
%        [137 149]
if n - floor(n) > 0
    error('input shoud be an integer')
end

if mod(n,2) == 1
    error('input should be an even number')
else
    pairMat = nan(n,2); % (:,1) for p1, (:,2) for p2
    for ti = 2 : n-2
        if isprime(ti)
            pairMat(ti,1) = ti;
            if isprime(n-ti)
                pairMat(ti,2) = n-ti;
            end
        end
    end
end
gcInd = find(isfinite(sum(pairMat,2))); % index of Goldbach conjecture, having no Nan in both columns
selInd = randi(length(gcInd)); % selected index
p1 = pairMat(gcInd(selInd),1);
p2 = pairMat(gcInd(selInd),2);
% p1 = n;
% p2 = n;
end

