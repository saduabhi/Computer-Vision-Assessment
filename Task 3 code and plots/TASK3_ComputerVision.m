% x and y csv read files contain the real co-ordinates
% a and b csv files contain Noisy version which are provided by the generic
% video detector.
x=csvread('x.csv');
y=csvread('y.csv');
a=csvread('a.csv');
b=csvread('b.csv');

%ploting the values from x and y csv files
plot(x, y, 'xb');
hold;
plot(a, b, '+r');

nx = a-x;
ny = b-y;
mean(nx)
mean(ny)
std(nx)
std(ny)


% plotting histogram figure for nx and ny
histogram(nx,6)
histogram(ny,6)

%plotting
plot(x, y, 'xb');
hold;
plot(a, b, '+r');
title('noise graph')

%task2: using kalman tracking 
z=[a;b]
[px, py] = kalmanTracking(z)

nnx = px-x;
nny = py-y;
mean(nx)
mean(ny)
plot(x, y, 'xb');
hold on
plot(a, b, '+r');
hold off

plot(x,y, 'xb', px, py, '+r', a,b,'oy');
legend({'x,y = real co-ordinates(x,y)','px,py = predicted co-ordinates(x,y)','a,b = noisy co-ordinates(a,b)'}, 'Location', 'northwest')

% Calculating the mean and standard deviation of absolute error and Root mean squared error for estimated value

Standard_deviation_absolute_error = sqrt( ((x-px).^2) + ((y-py).^2) )
Root_mean_standard_error = rms(Standard_deviation_absolute_error)

% Calculating the mean and standard deviation of absolute error and Root mean squared error for Noisy Co-ordinates value

Standard_deviation_absolute_error_NOISY = sqrt( ((x-a).^2) + ((y-b).^2) )
Root_mean_standard_error_NOISY = rms(Standard_deviation_absolute_error_NOISY)




