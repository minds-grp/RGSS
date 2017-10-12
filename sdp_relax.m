function [mse,val,indices]=sdp_relax(A,k,P,sigma)
% sigma is noise power
% P is covariance matrix of x
% k number of sensors to select
% A is the measurement matrix
[n,m]=size(A);
I =eye(m);
cvx_begin sdp quiet
variable z(n)
variable Y(m,m)
W=P^(-1)+sigma*(repmat(z,1,m).*A)'*A;
minimize trace(Y)
subject to
    [Y,I;I,W]>=0
    z>=0
    z<=1
    sum(z)==k
cvx_end
zz=z;
[~,index]=sort(zz,'descend');
indices = index(1:k);
z_rounded = zeros(n,1);
z_rounded(indices)=1;
mse = trace(inv(P^(-1)+sigma*(repmat(z_rounded,1,m).*A)'*A));
%toc;
val = trace(P)-mse;
end
