### Project 2: Image Recovery
Yufeng Yuan
yy208@duke.edu

- - -

##### Abstract

##### 1.Overview

##### 2.Mathematical Formulation
A 2-D image can be mapped to frequency domain by discrete cosine tranform(DCT)
$$
G(u,v)=\sum^P_{x=1}\sum^Q_{y=1}a_u \cdot b_v \cdot g(x,y) \cdot cos \frac{\pi(2x-1)(u-1)}{2 \cdot P} \cdot cos \frac{\pi (2y-1)(v-1)}{2 \cdot Q}
\\
x,u \in \{1,2,...P\}\\
y,v \in \{1,2,...Q\}\\

a_u=\left\{
\begin{aligned}
\sqrt \frac{1}{P} &\ (u=1)\\
\sqrt \frac{2}{P} &\ (2 \leq u \leq P)\\
\end{aligned}
\right.
\\

b_v=\left\{
\begin{aligned}
\sqrt \frac{1}{Q} &\ (v=1)\\
\sqrt \frac{2}{Q} &\ (2 \leq v \leq Q)\\
\end{aligned}
\right.
\\
$$
A 2-D image can be uniquely determined by inverse discrete cosine tranfrom(DCT), if all DCT coefficients are known
$$
g(x,y)=\sum^P_{u=1}\sum^Q_{v=1}a_u \cdot b_v \cdot G(u,v) \cdot cos \frac{\pi(2x-1)(u-1)}{2 \cdot P} \cdot cos \frac{\pi (2y-1)(v-1)}{2 \cdot Q}
$$
Sampling a 2-D image at M spatial locations results in a set of M linear equations
$$
g(x_1, y_1) = \sum^P_{u=1}\sum^Q_{v=1}a_u \cdot b_v \cdot G(u,v) \cdot cos \frac{\pi(2x_1-1)(u-1)}{2 \cdot P} \cdot cos \frac{\pi (2y_1-1)(v-1)}{2 \cdot Q}\\
g(x_2, y_2) = \sum^P_{u=1}\sum^Q_{v=1}a_u \cdot b_v \cdot G(u,v) \cdot cos \frac{\pi(2x_2-1)(u-1)}{2 \cdot P} \cdot cos \frac{\pi (2y_2-1)(v-1)}{2 \cdot Q}\\
\cdot \cdot \cdot \cdot\\
g(x_M, y_M) = \sum^P_{u=1}\sum^Q_{v=1}a_u \cdot b_v \cdot G(u,v) \cdot cos \frac{\pi(2x_M-1)(u-1)}{2 \cdot P} \cdot cos \frac{\pi (2y_M-1)(v-1)}{2 \cdot Q}
$$
Rewrite the linear equations in matrix form, which is an under-determined linear euqation\\
For simplicity, we use $$$ C_{m,u,v}$$$to denote $$$ a_u \cdot b_v \cdot cos \frac{\pi(2x_m-1)(u-1)}{2 \cdot P} \cdot cos \frac{\pi (2y_m-1)(v-1)}{2 \cdot Q}$$$
$$
\begin{bmatrix}
g(x_1,y_1)\\
g(x_2,y_2)\\
\vdots\\
g(x_M,y_M)\\
\end{bmatrix}=
\begin{bmatrix}
C_{1,1,1} & C{1,1,2} & \cdots & C_{1,P,Q-1} & C_{1,P,Q}\\
C_{2,1,1} & C{2,1,2} & \cdots & C_{2,P,Q-1} & C_{2,P,Q}\\
&&\vdots\\
C_{M,1,1} & C{M,1,2} & \cdots & C_{M,P,Q-1} & C_{M,P,Q}\\
\end{bmatrix}
\cdot
\begin{bmatrix}
G(1,1)\\
G(1,2)\\
\vdots\\
G()
\end{bmatrix}
$$
##### 3.Experimental Results

##### 4.Discussion
