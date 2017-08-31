delta_t = 0.01;

t = [0 : delta_t : 10];

x_tn = 1 ./ (1 + t).^2;

plot(t, x_tn), xlabel('t'), ylabel('x'), title('hw1.1');
