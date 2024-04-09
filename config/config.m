% ======= Model Startup ======= %
% ============================= %

%------- Physical Parameters -------%
prop.R    = 0.165;                   % [m]
prop.D    = 2*prop.R;                % [m]
prop.Area = pi*prop.R*prop.R;        % [m^2]
prop.Lcm    = 1;                     % [m]
prop.phi  = [45,135,225,315].*(pi/180);   % Rotors angular position.
prop.d    = [1,-1,1,-1];                  % Rotor directions.

%------- Motor Parameters -------%
motor.Rbat    = 0.03;                     % Internal resistence 1 Li-Cell
motor.a0      = 5.5;
motor.ct      = 0.012;
motor.surf    = 0.0855;
motor.CT      = 0.0047;
motor.CQ      = 0.228e-3;
motor.Ib      = 40.887e-6;
motor.lambda  = 0.00795;                  % Torque to current ratio of the motor.
motor.rho0    = 1.225;                    % Air density at sea level.
motor.Cm      = motor.CQ*prop.Area*prop.R^3*motor.Rbat*motor.rho0/motor.lambda;
motor.omega0  = 870;


aux         = (pi*prop.R^2)*(prop.R^2)*(motor.CT*prop.Lcm);
aux2        = -motor.CQ*prop.R/(motor.CT*prop.Lcm);

prop.M      = aux.*[ 1/prop.Lcm,           1/prop.Lcm,          1/prop.Lcm,          1/prop.Lcm;       ...
                    -sin(prop.phi(1)),    -sin(prop.phi(2)),   -sin(prop.phi(3)),   -sin(prop.phi(4)); ...
                     cos(prop.phi(1)),     cos(prop.phi(2)),    cos(prop.phi(3)),    cos(prop.phi(4)); ...
                     aux2*prop.d(1),       aux2*prop.d(2),      aux2*prop.d(3),      aux2*prop.d(4)];

%------- Inertial Parameters -------%
uav.mass    = 4.34;             % [kg]
uav.Ixx     = 0.0820;           % [kg-m^2] 
uav.Iyy     = 0.0845;           % [kg-m^2]
uav.Izz     = 0.1377;           % [kg-m^2]

uav.I       = [ uav.Ixx 0       0   ;...
                0       uav.Iyy 0   ;...
                0       0       uav.Izz];

uav.Ax = 1;
uav.Ay = 1;
uav.Az = 1;

%------- Wind Conditions -------%
wind.wx = 0;
wind.wy = 0;
wind.wz = 0;
wind.Speed = [wind.wx wind.wy wind.wz];

%------- Initial Conditions -------%
initialState.PositionE = [0 0 -2]; % [pn pe pd]

initialState.VelocityB = [0 0 0];      % [ub vb wb]

initialState.RatesB = [0 0 0];         % [p q r]

initialState.EulerB = [0 0 0];       % [roll pitch yaw]

%------- References -------%
reference.H = 0;

reference.latitude = 0;
reference.longitude = 0;

reference.G = [reference.latitude ...
               reference.longitude];
