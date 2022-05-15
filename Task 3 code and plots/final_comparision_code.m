plot(Standard_deviation_absolute_error,'r')
%legend('standard deviation of estimated co-ordinates')
hold on
plot(Standard_deviation_absolute_error_NOISY,'b')
%egend('standard deviation of Noisy co-ordinates')
legend({'standard deviation of estimated co-ordinates','standard deviation of Noisy co-ordinates'}, 'Location', 'northwest')
hold off