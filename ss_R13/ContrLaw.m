function cvc = ContrLaw(uv,z,uv_final,Fu,Fv,u0,v0,lambda)

% CONTRLAW Compute the kinematic screw for 2D image-based visual servoing.
% uv, uv_final are 2 x N matrix of pixel coordinates (current, and desired)
% z is a N x 1 vector of depth
% FU, Fv, u0, v0 are the camera intrinsic parameters
% lambda is the control gain.

% 1ST STEP: Compute image coordinates

n = size(uv,2);

s = pixel2coord(uv,Fu,Fv,u0,v0);
s_final = pixel2coord(uv_final,Fu,Fv,u0,v0);

% 2ND STEP: Construct interaction (Jacobian) matrix

J = zeros(2*n,6);

for i=1:n
    x = s(i*2-1);
    y = s(i*2);
    J(i*2-1,:) = [-1/z(i) 0    x/z(i)  x*y -(1+x^2) y];
    J(i*2,:)   = [   0 -1/z(i) y/z(i) 1+y^2  -x*y  -x];    
end

% 3RD STEP: Compute the pseudo-inverse of the interaction matrix

Ji = pinv(J);

% 4TH STEP: Apply the proportional control law

cvc = -lambda * Ji * (s - s_final);

% end of ContrLaw

function s = pixel2coord(uv,Fu,Fv,u0,v0);

n = size(uv,2);

u = uv(1,:);
v = uv(2,:);

x = (u - u0) / Fu;
y = (v - v0) / Fv;
s = reshape([x; y], 2*n,1);

% end of pixel2coord
