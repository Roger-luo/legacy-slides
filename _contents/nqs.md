---
title: Neural Network Quantum State
subtitle: A machine learning approach
author: Roger Luo
...

# A brief intro for Boltzmann machine

---

This part is in my [blog](http://rogerluo.me/en/2016/09/25/boltzmann-machine/)

Chinese version: [Boltzmann Machine](http://rogerluo.me/2016/11/10/boltmann-machine/)

---

A Boltzmann machine, like a Hopefield network, is a network of units with an "energy" defined for the network. It also has binary units, but unlike Hopefield nets, Boltzmann machine units are stochastic. The global energy $E$, in a Boltzmann machine is identical in form to that of a Hopfield network

---


$$
E = -(\sum_{i,j}\omega_{ij} s_i s_j +\sum_i\theta_i s_i)
$$

Where:

- $\omega_{ij}$ is the connection strength between unit $j$ and unit $i$
- $s_i$ is the state, $s_i\in {0,1}$, of unit $i$
- $\theta_i$ is the bias of unit $i$ in the global energy function. ($-\theta_i$ is the activation threshold for the unit)

---

Often the weights are represented in matrix form with a symmetric matrix $W$, with zeros along the diagonal.

---

### Probability of a unit's state

The difference in the global energy that results from a single unit $i$ being 0 (off) versus 1 (on), written $\Delta E_i$, assuming a symmetric matrix of weights, is given by:

$$
\Delta E_i = \sum_{j} \omega_{ij}s_j + \theta_i
$$

---

This can be expressed as the difference of energies of two states:

$$
\Delta E_i = E_{i=off} - E_{i=on}
$$

---

We then substitute the energy of each state with its relative probability

$$
\begin{aligned}
\Delta E_i &= -T\ln(p_{i=off})+T\ln(p_{i=on})\\\\
\frac{\Delta E_i}{T} &= \ln(p_{i=on}) - \ln(1-p_{i=on})\\\\
p_{i=on} &= \frac{1}{1+\exp(-\frac{\Delta E_i}{T})}
\end{aligned}
$$

Where $T$ is the temperature of the system.

---

### Equilibrium state

> - choosing a unit 
> - setting its state according to the above formula
> - Repeat!

---

### Training

Divide units into:

> - visible
> - hidden

---

The visible units are those which receive information from the 'environment', i.e. our training set is a set of binary vectors over the set V. The distribution over the training set is denoted $P^{+}(V)$.

---

As is discussed above, the distribution over global states converges as the Boltzmann machine reached thermal equilibrium. We denote this distribution, after we marginalize it over the hidden units, as $P^{-}(V)$.

---

Our goal is to approximate the 'real' distribution $P^{+}(V)$ using the $P^{-}(V)$ which will be produced (eventually) by the machine. To measure how similar the two distributions are, we use the Kullback-Leibler divergence (ususlly noted as KL-divergence) $KL(+|-)$:

---

$$
KL(+|-) = \sum_{v} P^+ (v) \ln(\frac{P^{+}(v)}{P^{-}(v)})
$$

---

where the sum is over all the possible states of $V$. $KL(+|-)$ is a function of the weights, since they determine the energy of a state, and the energy determines $P^{-}(v)$. Therefore, a gradient decent can be simply applied over $KL$

---

Actually, the process of training a Boltzmann machine we discussed above can be considered as a thermal equilibrium process with artificial boundary condition. 

---

(The boundary is determined by visible units) The training method we use is likely a kind of equilibrium statistical mechanics, recent research has been considering the application about nonequilibrium statistical mechanics on unsupervised learning. (see [arxiv:1503.03585](https://arxiv.org/pdf/1503.03585.pdf))

---

# Neural-Network Quantum State

---

A quantum state can be perfectly mapped to a Boltzmann Machine's probability distribution, which has been widely applied into quantum machine learning algorithms.

---

eg.

$$
P(00\cdots00)|00\cdots00\rangle + P(00\cdots01)|00\cdots01\rangle + \cdots + P(11\cdots11)|11\cdots11\rangle
$$

$$
P(v,h)|v\rangle|h\rangle \rightarrow P_{Model}(v,h|W)
$$

---

In this work, the quantum state is represented in this form

$$
    P(v,h|W) = \sum_{h_i} e^{\sum_j a_j\sigma_j^z + \sum_i b_i h_i+\sum_{ij}W_{ij}h_i\sigma_j^z}
$$

where $\sigma_j^z$ represents the $j$th spin configuration on z-axis, and it is called the Neural-network Quantum State.

---

And the quantum state is 

$$
|\Psi\rangle = \sum P(h,v|W)|h\rangle|v\rangle
$$

---

### Training
Training is accomplished by optimizing the Energy

$$
E = \frac{\langle\Psi|H|\Psi\rangle}{\langle\Psi|\Psi\rangle}
$$

---

# Optimization Method

---

Current Optimization Method we re-implemented is the Stochastic Reconfiguration Method, however according to the author its performance is not good.

---

## SR optimization

[notes](https://www.zybuluo.com/RogerLuo/note/670176)

---

## Will imaginary evolution work?

---

# Proposals

---

Since the performence of a neural network mainly depends on it topological structure rather than optimization method, several possible nets could be applied in calculating ground state inspired by NQS

> - Reinforcement learning methods
> - Deep Belief Nets
> - Deep Boltzmann Machine + Deep Belief Nets

---

Furthermore, will NQS be expended to Hamiltonian? eg. Convert a complex Hamiltonian to a simple Hamiltonian by Neural nets?

some possible approaches inspired from quantum machine learning algorithms:

> - Quantum Boltzmann machine
> - Fermion Bolzamnn machine
