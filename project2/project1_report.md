### Project 2: Image Recovery
Yufeng Yuan
yy208@duke.edu

- - -

##### Abstract
In this project, for a given image, we need to sample some poxel points in the image and to recover the original image. For the sampling process, we segment the test set randomly and train the model on current training set several times to find the best hyperparameter with cross-validation. For the sampled points, with Discrete Cosine Tranformation, we can form an under-determined linar system which could be solved by Onthagonal Match Pursuit. Then, we would have the sparse solution for the OMP coefficients which enable us to recover the image with Inverse Discrete Cosine Transformation. The accuracy of the recovery could be measured by a given function.

##### 1.Overview
First, I implemented a function for random sampling with a Matlab built-in function randomperm which ensures that there's no repeated points in the samples. For the robustness and simplicity, I implemented one function generating the under-determined lieanr system of Discrete Cosine Tranformation. For the function OMPSolver, I implemented the function with some matrix operation techniques in Matlab to improve the running efficienty.
##### 2.Mathematical Formulation
Wrong Wrong Wrong !!!
A 2-D image can be mapped to frequency domain by discrete cosine tranform (DCT)
$$
G(u,v)=\sum^P_{x=1}\sum^Q_{y=1}a_u \cdot b_v \cdot g(x,y) \cdot cos \frac{\pi(2x-1)(u-1)}{2 \cdot P} \cdot cos \frac{\pi (2y-1)(v-1)}{2 \cdot Q}
\\
x,u \in \{1,2,...P\}\\
y,v \in \{1,2,...Q\}\\

a_u=\left\{st 
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
The implementation of OMP algorithm
$$
\min_\alpha \Vert A \alpha - B\Vert^2_2\\
S.T. \Vert \alpha \Vert_0 \leq \lambda
$$
Step 1: Set F = B, $$$ \Omega = \{\}$$$ and p = 1
Step 2: Calculate the inner product values $$$ \theta_i = <A_i, F>$$$
Step 3: Identify the index s for which $$$\vert \theta_s\vert$$$ takes the largest number
Step 4: Update $$$\Omega $$$ by $$$\Omega = \Omega \cup \{s\}$$$
Step5: Approximate F by the linear combination of $$$ \{ A_i, i \in \Omega \} $$$
$$
\min_{a_i,j \in \Omega} \Vert \sum_{i\in\Omega }\alpha_i \cdot A - B \Vert_2^2
$$
Step 6: Update F
$$
F = B - \sum_{i \in \Omega}\alpha_i \cdot A
$$
Step 7: if p $$$ \le \lambda $$$, p = p + 1 and go to Step 2. Otherwise, stop.
$$
\alpha_i = 0 (i \notin \Omega)
$$
##### 3.Experimental Results

##### 4.Discussion
