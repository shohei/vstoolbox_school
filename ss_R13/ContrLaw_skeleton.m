function cvc = ContrLaw(uv,z,uv_final,Fu,Fv,u0,v0,lambda)

% CONTRLAW Compute the kinematic screw for 2D image-based visual servoing.
% uv, uv_final are 2 x N matrix of pixel coordinates (current, and desired)
% z is a N x 1 vector of depth
% FU, Fv, u0, v0 are the camera intrinsic parameters
% lambda is the control gain.

% 1ST STEP: Compute image coordinates

% 2ND STEP: Construct interaction (Jacobian) matrix

% 3RD STEP: Compute the pseudo-inverse of the interaction matrix

% 4TH STEP: Apply the proportional control law
