---
title: quantum machine learning
author: 罗秀哲,林霆,康文永,魏正威
...

# Towards the age of quantum computing

#

As experimental implementation of quantum computing grew rapidly in recently years, it would be possible to consider the machine learning algorithm in quantum computing.

# Motivation

The interface for quantum computing could still be difficult to use. There are various frameworks and libraries in classical machine learning algorithms. However, none of them includes quantum algorithms. This proposal would mainly focus on implementing existing quantum machine learning related algorithms in a user-friendly interface based on the simulation framework `quantum++` and `QuCmp.jl`

---

### Quantum++ and QuCmp.jl

`Quantum++` is a c++ based quantum simulation framework implemented by IQC (Institue of Quantum Computing) and `QuCmp.jl` is a simulation framework based on Julia.


---

Project Goal: class library for quantum machine learning

---

#

The proposal will realize:

> - quantum reject sampling
> - Gradient Estimation via Quantum Sampling
> - Gradient Estimation via Quantum Ampitude Estimation
> - A simple Quantum Deep Bolzman Machine via GEQS and GEQAE

---

A brief intro for quantum deep learning:

---

Quantum deep learning is mainly based on Boltzmann machine:
$$
E(v,h) = -\sum_{i} v_i b_i - \sum_{j} h_j d_j -\sum_{i,j} \omega_{ij}^{vh} v_i h_j - \sum_{i,j} \omega_{i,j}^{v} v_i v_j - \sum_{i,j}\omega_{i,h}^{h} h_i h_{j}
$$


The training of a Boltzmann machine could be extremely hard on classical computer. However, it may not be a big question for a quantum computer.

---

The quantum deep learning algorithm is actually based on Deep Boltzmann machine (with multiple hidden layers)

---

And the algorithm to achieve a fast training speed is introduced as Gradient Estimation via Quatnum Sampling. By some mathematical calculation, if the state:

$$
\sum_{v,h} \sqrt{Q(v,h)} |v\rangle|h\rangle
$$

---

is prepared and each of the amplitudes are multiplied by $\sqrt{P(v,h)}$
, then the result will be proportional to the desired state.

$$
\sum_{v,h} \sqrt{Q(v,h)}|v\rangle|h\rangle|P(v,h)\rangle (\sqrt{1-P(v,h)}|0\rangle +\sqrt{P(v,h)}|1\rangle)
$$

---

Preparing this state is efficient as the $e^{-E(v,h)}$ and $Q(v,h)$ can be calcualted in time that is polynomial in the number of visible and hidden units.

---

Complexity analysis:

CD-k: $N_{train}lEk$
GEQAE: $\sqrt{N_{train}}E^2(\sqrt{\kappa}+max_{x}\sqrt{\kappa_x})$

---


## reference

[1] Quantum Deep Learning, Nathan Wiebe, Ashish Kapoor, and Krysta M. Svore

[2] Quantum Reject Sampling, Maris Ozols, Martin Roetteler

[3] Machine Learning in a Quantum World
