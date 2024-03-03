% Geometric Parameters
R   = 0.165;                        % Propeller radius.
D   = 2*R;                          % Propeller diameter.
A   = pi*R*R;                       % Propeller front area.
L   = 1;                            % Distance from CM to Rotor.
phi = [45,135,225,315].*(pi/180);   % Rotors angular position.


% Propulsion Parameters
Rbat    = 0.03; % Internal resistence 1 Li-Cell
a0      = 5.5;
ct      = 0.012;
surface = 0.0855;
CT      = 0.0047;
CQ      = 0.228e-3;
Ib      = 40.887e-6;
lambda  = 0.00795;  % Torque to current ratio of the motor.
rho0    = 1.225;    % Air density at see level.
Cm      = CQ*A*R*R*R*Rbat*rho0/lambda;

omega0  = 870;
Cd      = 0.01;
d       = [1,-1,1,-1]; % Rotor directions.

aux         = (D*D*D*D)/(4*pi*pi);
aux2        = -CQ*D/(CT*L);
propsMatrix = aux.*[ 1/L,            1/L,            1/L,            1/L;        ...
                    -sin(phi(1)),   -sin(phi(2)),   -sin(phi(3)),   -sin(phi(4));...
                    cos(phi(1)),    cos(phi(2)),    cos(phi(3)),    cos(phi(4)); ...
                    aux2*d(1),      aux2*d(2),      aux2*d(3),      aux2*d(4)];

% Mass Parameters
mass    = 4.34;
Ixx     = 0.0820;
Iyy     = 0.0845;
Izz     = 0.1377;
I       = [ Ixx 0   0   ;...
            0   Iyy 0   ;...
            0   0   Izz];

% Wind conditions
wx = 0;
wy = 0;
wz = 0;
windSpeedInertial = [wx wy wz];

% Initial conditions
xe = 0;
ye = 0;
ze = 2;
initialPositionInertial = [xe ye ze];

u = 0;
v = 0;
w = 0;
initialVelocityBody = [u v w];

p = 0;
q = 0;
r = 0;
initialRatesBody = [p q r];

roll    = 0;
pitch   = 0;
yaw     = 0;
initialEulerAngles = [roll pitch yaw];

referenceHeight = 0;
latitude        = 0;
longitude       = 0;
referenceGeodeticPosition = [latitude longitude];
