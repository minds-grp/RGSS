function [MSE,f_value, indices]= senor_selection(A,k,P,sigma,eps)
% eps = 0 for greedy and 0<eps<1 for randomized greedy
% sigma is noise power
% P is covariance matrix of x
% k number of sensors to select
% A is the measurement matrix
f_value = 0;
indices = zeros(1,k);
[n,~] = size(A);
A = A';
F_inv = P;
all_indices = 1:n;
if eps
    select_size = floor(max(min(-n/k*log(eps),n),1));
end
i =0;
while (i < k)
    i = i+1;
    if eps == 0
        picked_indices = all_indices;
    else
        picked_indices = randsample(all_indices,select_size);
    end
    B_s = F_inv*A(:,picked_indices);
    [max_value,max_index] = max(sum(B_s.^2,1)./(sigma+...
        sum(A(:,picked_indices).*B_s,1)));
    index_to_add = picked_indices(max_index);
    F_inv = F_inv-(B_s(:,max_index)*B_s(:,max_index)')/...
        (sigma+A(:,index_to_add)'*B_s(:,max_index));
    f_value = f_value+max_value;
    indices(i) = index_to_add;
    all_indices = setdiff(all_indices,index_to_add);
end
MSE = trace(P)-f_value;
