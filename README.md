# Central Limit Theorem Simulations

Define the product of $k$-lagged differences between two vectors $X$ and $Y$ as

$$
	T_k(X, Y) = \sum_{i=1}^{n}(X_i - X_{i+k})(Y_i - Y_{i+k}).
$$

In matrix form, we define
$$n X^T A Y = 2 T_1(X, Y) - T_2(X, Y). $$

We want to show that for
```math
	S =
	\begin{bmatrix}
		X^T A X \\
		Y^T A Y \\
		X^T A Y 
	\end{bmatrix},
	\qquad
	\mathbb{E}\left(S\right) =
	\begin{bmatrix}
		\sigma_x^2 \\
		\sigma_y^2 \\
		\sigma_{xy}
	\end{bmatrix},
```
it follows from the central limit theorem that
```math
	S - \mathbb{E}\left(S\right)
	\xrightarrow{d}
	N(0, \Sigma_S).
```

---

This result is not trivial since not all of the components are independent. Therefore, we apply the central limit theorem for correlated sequences.

To show this, we define
```math
	R =
	\begin{bmatrix}
		T_1(X, X) \\
		T_2(X, X) \\
		T_1(Y, Y) \\
		T_2(Y, Y) \\
		T_1(X, Y) \\
		T_2(X, Y)
	\end{bmatrix}.
```

We evaluate $Cor(R)=$
```math
\begin{bmatrix}
V(T_1(X, X)) & \text{Cov}(T_1(X, X), T_2(X, X)) & \text{Cov}(T_1(X, X), T_1(Y, Y)) & \text{Cov}(T_1(X, X), T_2(Y, Y)) & \text{Cov}(T_1(X, X), T_1(X, Y)) & \text{Cov}(T_1(X, X), T_2(X, Y)) \\
             & V(T_2(X, X))                     & \text{Cov}(T_2(X, X), T_1(Y, Y)) & \text{Cov}(T_2(X, X), T_2(Y, Y)) & \text{Cov}(T_2(X, X), T_1(X, Y)) & \text{Cov}(T_2(X, X), T_2(X, Y)) \\
             &                                  & V(T_1(Y, Y)) & \text{Cov}(T_1(Y, Y), T_2(Y, Y)) & \text{Cov}(T_1(Y, Y), T_1(X, Y)) & \text{Cov}(T_1(Y, Y), T_2(X, Y)) \\
             &                                  & & V(T_2(Y, Y)) & \text{Cov}(T_2(Y, Y), T_1(X, Y)) & \text{Cov}(T_2(Y, Y), T_2(X, Y)) \\
             &                                  & & & V(T_1(X, Y))                     & \text{Cov}(T_1(X, Y), T_2(X, Y)) \\
             &                                  & & &                                  & V(T_2(X, Y))
\end{bmatrix}
```

The elements are evaluated as
```math
	\begin{aligned}
		\mathbb{V}\left( T_1(X, X) \right)
		 & =
		12 n \sigma_x^4 +
		8 \sigma_x^2 T_1(\theta_x, \theta_x)  \\
		% ---
		\mathbb{V}\left( T_2(X, X) \right)
		 & =
		12 n \sigma_x^4 +
		16 \sigma_x^2 T_1(\theta_x, \theta_x) \\
		% ---
		\mathbb{V}\left( T_1(Y, Y) \right)
		 & =
		12 n \sigma_y^4 +
		8 \sigma_y^2 T_1(\theta_y, \theta_y)  \\
		% ---
		\mathbb{V}\left( T_2(Y, Y) \right)
		 & =
		12 n \sigma_y^4 +
		16 \sigma_y^2 T_1(\theta_y, \theta_y) \\
		% --- 
		\mathbb{V}\left( T_1(X, Y) \right)
		 & = \\
		\mathbb{V}\left( T_2(X, Y) \right)
		 & = \\
		% ---
		Cov(T_1(X, X), T_2(X, X))
		 & =
		8 n \sigma_x^4 +
		8 \sigma_x^2 T_1(\theta_x, \theta_x)  \\
		% ---
		Cov(T_1(Y, Y), T_2(Y, Y))
		 & =
		8 n \sigma_y^4 +
		8 \sigma_y^2 T_1(\theta_y, \theta_y) \\
		% ---
		Cov(T_1(X, X), T_1(X, Y))
    &=  \\
		% ---
		Cov(T_1(Y, Y), T_1(X, Y))
    &=  \\
		% ---
		Cov(T_1(Y, Y), T_1(X, Y))
    &=  \\
		% ---
	\end{aligned}
```



