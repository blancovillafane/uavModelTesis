% Aerodynamic Parameters
a0      = 5.5;
ct      = 0.012;
surface = 0.0855;
CT      = 0.0047;
CQ      = 0.228e-3;
Ib      = 40.887e-6;
R       = 0.165;
density = 1.184;
omega0  = 870;
Cd      = 0.01;

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
