function p = polyhedra(varargin)
% POLYHEDRA Constructor function for "polyhedra" object
switch nargin
case 0      % "null" polyhedra: single point at origin
    p.m = [0 0 0 1]';
    p.e = [];
    p.fc = 'none';
    p.showv = 1;
    p = class(p,'polyhedra');
case 1      
    if (isa(varargin{1},'polyhedra'))
        p = varargin{1};
    elseif (isa(varargin{1},'double'))  % Polyhedra with vertices defined by a matrix of points WITHOUT edges
        [r,c] = size(varargin{1});
        if r==3
            p.m = [varargin{1}; ones(1,c)];
            p.e = [];
            p.fc = 'none';
            p.showv = 1;
            p = class(p,'polyhedra');
        elseif r==4
            p.m = varargin{1};
            p.e = [];
            p.fc = 'none';
            p.showv = 1;
            p = class(p,'polyhedra');
        else
            error('Wrong matrix dimensions')
        end
    else
        error('Wrong argument type')
    end
case 2
    if (isa(varargin{1},'double'))  % Polyhedra with vertices defined by a matrix of points WITH edges
        [r,c] = size(varargin{1});
        if r==3
            p.m = [varargin{1}; ones(1,c)];
            p.e = varargin{2};
            p.fc = 'none';
            p.showv = 1;
            p = class(p,'polyhedra');
        elseif r==4
            p.m = varargin{1};
            p.e = varargin{2};
            p.fc = 'none';
            p.showv = 1;
            p = class(p,'polyhedra');
        else
            error('Wrong matrix dimensions')
        end
    elseif (isa(varargin{1},'char'))
        s = varargin{1};
        if strcmp(s,'square')           % Single square face of length l, centered at origin, on XY-plane
            l = varargin{2};
            p = polyhedra('polygon',4,l);
        elseif strcmp(s,'tetrahedron')
            l = varargin{2};
            p = polyhedra('pyramid',3,l,l*sqrt(2/3));
        else
            error('Wrong argument type')
        end
    else
        error('Wrong argument type')
    end
case 3
if (isa(varargin{1},'char'))
        s = varargin{1};
        if strcmp(s,'polygon')          % Polygon of n basepoints, baselength l
            n = varargin{2};
            l = varargin{3};
            v = zeros(n,3);
            for i=1:n
                v(i,:) = [l*cos(i*2*pi/n) l*sin(i*2*pi/n) 0];
            end
            p = polyhedra(v',[1:n]);
        else
            error('Wrong argument type')
        end
    else
        error('Wrong argument type')
    end
case 4
    if (isa(varargin{1},'char'))
        s = varargin{1};
        if strcmp(s,'pyramid')          % Pyramid of n basepoints, baselength l, and height h
            n = varargin{2};
            l = varargin{3};
            h = varargin{4};
            v = zeros(n+1,3);
            f = zeros(n,3);
            for i=1:n-1
                v(i,:) = [l*cos(i*2*pi/n) l*sin(i*2*pi/n) 0];
                f(i,:) = [i,i+1,n+1];
            end
            v(n,:) =  [l 0 0];
            f(n,:) = [n,1,n+1];
            v(n+1,:) = [0 0 h];
            if n==3
                f = cat(1,f,[1:n]);
            end
            p = polyhedra(v',f);
        else
            error('Wrong argument type')
        end
    else
        error('Wrong argument type')
    end
otherwise
    error('Wrong number of input arguments')
end
