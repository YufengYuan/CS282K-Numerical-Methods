# Homework1
###Yufeng Yuan
- - -

###Homework1.1
###Source code
```matlab
% hw1.1
delta_t = 0.01;
t = [0 : delta_t : 10];
% the formular derived
x_tn = 1 ./ (1 + t).^2;
plot(t, x_tn), xlabel('t'), ylabel('x'), title('hw1.1');
```
###Output
![hw1_1_graph.png](./hw1_1_graph.png)

###Homework1.2
###Source code
```matlab
% hw1.2
A = [2, -1, 0;
     -1, 2, -1;
     0, -1, 2];
B = [30; 0; 100];
% solve linear equation AX = B
X = A\B
```
###Output
```matlab
>> hw1_2

X =

   47.500
   65.000
   82.500

>>
```

